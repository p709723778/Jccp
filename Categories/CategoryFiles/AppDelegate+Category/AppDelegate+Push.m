//
//  AppDelegate+Push.m
//  Jccp
//
//  Created by Gary on 14-3-20.
//  Copyright (c) 2014年 蒲晓涛. All rights reserved.
//

#import "AppDelegate+Push.h"

@implementation AppDelegate (Push)


//本地推送处理
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{
    
}

//远程通知注册成功委托
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    NSLog(@" deviceToken : %@",[deviceToken description]);
    
}

//远程通知注册失败委托
-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    NSLog(@"%@",[error description]);
}

/**
 *  在iOS7中，通过推送通知，可以启动一个后台下载操作任务。
 *  该方法在IOS6下是不能被调用的,如想适配IOS6 要调用类似的另外一个方法
 *
 *  @param application       application
 *  @param userInfo          userInfo 推送内容
 *  @param completionHandler 后台操作
 */
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler{

    for (id key in userInfo) {
        
        NSLog(@"key: %@, value: %@", key, [userInfo objectForKey:key]);
        
    }
}

@end
