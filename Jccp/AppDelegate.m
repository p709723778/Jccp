//
//  AppDelegate.m
//  Jccp
//
//  Created by Gary on 13-12-30.
//  Copyright (c) 2013年 蒲晓涛. All rights reserved.
//

#import "AppDelegate.h"
#import "UncaughtExceptionHandler.h"
#import "AppDelegateHelper.h"
#import "AppTabBarController.h"
#import "CBIntrospect.h"
#import "GaryPersonalLog.h"

@implementation AppDelegate

- (void)dealloc
{
    self.window = nil;
    self.appTabBarController = nil;
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.

    // 本人版权日志输出
    [GaryPersonalLog outPutPersonalLog];
    // must be set before any nib is called
    [CBIntrospect setIntrospectorKeyName:@"introspectorName"];

    if ([AppDelegateHelper sharedAppDelegateHelper].isFirst) {
        AppDelegateHelper *ppDelegateHelper = [AppDelegateHelper sharedAppDelegateHelper];
        NSLog(@"%@", (ppDelegateHelper.isFirst) ? @"是" : @"否");
    }

    InstallUncaughtExceptionHandler(); // 异常监听

    // 设置导航栏风格
    [AppDelegateHelper setNavigationBarStyle];

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    //    //根据iPhone / iPad 进行界面初始化
    //    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
    //        self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    //    } else {
    //        self.viewController = [[ViewController alloc] initWithNibName:@"ViewController_iPad" bundle:nil];
    //    }
    self.appTabBarController = [AppDelegateHelper loadTabBarController];
    self.window.rootViewController = _appTabBarController;
    [self.window makeKeyAndVisible];

    // UI调试工具加载  在模拟器模式下使用
    if (TARGET_IPHONE_SIMULATOR) {
        [[CBIntrospect sharedIntrospector] start];

        /**
         *   Listen for remote notification messages.
         *   Notifications can be sent from View Introspector, using the Messenger window.
         *该方法执行后,didRegisterForRemoteNotificationsWithDeviceToken会接收一个96位字符的token
         */
        [[CBIntrospect sharedIntrospector] listenForRemoteNotifications];
    }

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end