//
//  AppDelegate.m
//  Jccp
//
//  Created by Gary on 13-12-30.
//  Copyright (c) 2013年 蒲晓涛. All rights reserved.
//

#import "AppDelegate.h"
#import "GYUncaughtExceptionHandler.h"
#import "GYAppDelegateHelper.h"
#import "GYAppTabBarController.h"
#import "CBIntrospect.h"
#import "GYGaryPersonalLog.h"

#import "MMDrawerController.h"

#import "AFNetworkActivityIndicatorManager.h"

@implementation AppDelegate

- (void)dealloc
{
    self.window = nil;
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{}

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [GYAppDelegateHelper loadMMDrawerController];

    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    NSDictionary *dic = @{ @"pid" : @5,@"page" : @1,@"limit" : @1  };
    
    [[GYHTTPNetWorkManager sharedGYHTTPNetWorkManager] POST:@"?c=api_zx&a=getZxList&callType=XML" parameters:dic success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *dic = [GYResolveDataUtility dictionaryWithData:responseObject];
        NSLog(@"ok:%@",dic);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"失败");
    }];
    
    [[GYHTTPNetWorkManager sharedGYHTTPNetWorkManager] GET:@"?c=api_betting&a=loadMoreBettingIssue&callType=XML" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *dic = [GYResolveDataUtility dictionaryWithData:responseObject];
        NSLog(@"ok:%@",dic);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"失败");
    }];
    
    // 本人版权日志输出
    [GYGaryPersonalLog outPutPersonalLog];
    // must be set before any nib is called
    [CBIntrospect setIntrospectorKeyName:@"introspectorName"];
    
    //设置状态栏里的旋转菊花是否显示
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    
    if ([GYAppDelegateHelper sharedGYAppDelegateHelper].isFirst) {
        GYAppDelegateHelper *appDelegateHelper = [GYAppDelegateHelper sharedGYAppDelegateHelper];
        NSLog(@"%@", (appDelegateHelper.isFirst) ? @"是" : @"否");
    }

    InstallUncaughtExceptionHandler(); // 异常监听

    // 设置导航栏风格
    [GYAppDelegateHelper setNavigationBarStyle];

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