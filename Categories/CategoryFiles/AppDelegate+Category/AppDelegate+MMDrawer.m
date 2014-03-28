//
//  AppDelegate+MMDrawer.m
//  Jccp
//
//  Created by Gary on 14-3-28.
//  Copyright (c) 2014年 蒲晓涛. All rights reserved.
//

#import "AppDelegate+MMDrawer.h"

#import "MMDrawerController.h"

@implementation AppDelegate (MMDrawer)

// 是否保留界面状态
- (BOOL)application:(UIApplication *)application shouldSaveApplicationState:(NSCoder *)coder
{
    return YES;
}

// 是否恢复之前退出的界面
- (BOOL)application:(UIApplication *)application shouldRestoreApplicationState:(NSCoder *)coder
{
    return YES;
}

// 返回你最后选择的控制器界面
- (UIViewController *)application:(UIApplication *)application viewControllerWithRestorationIdentifierPath:(NSArray *)identifierComponents coder:(NSCoder *)coder
{
    NSString *key = [identifierComponents lastObject];

    if ([key isEqualToString:@"MMDrawer"]) {
        return self.window.rootViewController;
    } else if ([key isEqualToString:@"MMExampleCenterNavigationControllerRestorationKey"]) {
        return ((MMDrawerController *)self.window.rootViewController).centerViewController;
    } else if ([key isEqualToString:@"MMExampleRightNavigationControllerRestorationKey"]) {
        return ((MMDrawerController *)self.window.rootViewController).rightDrawerViewController;
    } else if ([key isEqualToString:@"MMExampleLeftNavigationControllerRestorationKey"]) {
        return ((MMDrawerController *)self.window.rootViewController).leftDrawerViewController;
    } else if ([key isEqualToString:@"MMExampleLeftSideDrawerController"]) {
        UIViewController *leftVC = ((MMDrawerController *)self.window.rootViewController).leftDrawerViewController;

        if ([leftVC isKindOfClass:[UINavigationController class]]) {
            return [(UINavigationController *)leftVC topViewController];
        } else {
            return leftVC;
        }
    } else if ([key isEqualToString:@"MMExampleRightSideDrawerController"]) {
        UIViewController *rightVC = ((MMDrawerController *)self.window.rootViewController).rightDrawerViewController;

        if ([rightVC isKindOfClass:[UINavigationController class]]) {
            return [(UINavigationController *)rightVC topViewController];
        } else {
            return rightVC;
        }
    }

    return nil;
}

@end