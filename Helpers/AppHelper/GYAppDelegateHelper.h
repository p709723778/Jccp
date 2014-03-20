//
//  GYAppDelegateHelper.h
//  Jccp
//
//  Created by Gary on 14-3-20.
//  Copyright (c) 2014年 蒲晓涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GYAppTabBarController;

@interface GYAppDelegateHelper : NSObject

GY_SINGLETON_FOR_HEADER(GYAppDelegateHelper);

///是否第一次启动
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
+ (GYAppTabBarController *)loadTabBarController;

/**
 *  设置导航栏风格,title字体, 颜色 ,阴影
 */
+ (void)setNavigationBarStyle;


@end
