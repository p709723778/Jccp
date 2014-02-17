//
//  AppDelegateHelper.h
//  Jccp
//
//  Created by Gary on 14-2-17.
//  Copyright (c) 2014年 蒲晓涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AppTabBarController;

@interface AppDelegateHelper : NSObject


@property(assign, nonatomic)BOOL isFirst;


/**
 *	@brief	启动页加载动画
 *
 *	@param 	mainMindow 	程序主window界面
 */
+ (void)appLaunchingWithAnimation:(UIWindow *)mainMindow;

/**
 *	@brief	TabBarController加载
 *
 *	@return	TabBarController
 */
+ (AppTabBarController *)loadTabBarController;

/**
 *  设置导航栏风格,title字体, 颜色 ,阴影
 */
+ (void)setNavigationBarStyle;

@end
