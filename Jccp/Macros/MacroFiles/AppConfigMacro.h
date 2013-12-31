//
//  AppConfigMacro.h
//  Jccp
//
//  Created by Gary on 13-12-30.
//  Copyright (c) 2013年 蒲晓涛. All rights reserved.
//

/**
 *	@brief	此头文件是描述设备的设置和信息  判断是什么设备已经在UIDevice+SystemInfo.h了
 */

#ifndef Jccp_AppConfigMacro_h
#define Jccp_AppConfigMacro_h

#pragma mark - 获取屏幕分辨率

#define G_dWidth [UIScreen mainScreen].currentMode.size.width
#define G_dheight [UIScreen mainScreen].currentMode.size.height

//-------------------获取设备大小-------------------------
#pragma mark - 获取设备不同部位的高度

//获取屏幕高度(包含状态栏,导航栏,选项卡等),即:整个屏幕的高度
#define G_ScreenHeight [[UIScreen mainScreen] bounds].size.height

//获取屏幕宽度 即:整屏的宽度
#define G_ScreenWidth [[UIScreen mainScreen] bounds].size.width

#define G_StateBarHeight 20//获取状态栏的高度
#define G_NavBarHeight   44  //导航栏高度
#define G_TabBarHeight   49  //底部选项卡高度
#define G_MainHeight (G_ScreenHeight - G_StateBarHeight)//减去状态栏屏幕高度
#define G_MainWidth G_ScreenWidth//主屏宽度


#pragma mark -App Id , 下载地址 , 评价地址

#define G_AppID      @"593499239"

#define G_AppDownloadURL     [NSString stringWithFormat:@"https://itunes.apple.com/us/app/ling-hao-xian/id%@?ls=1&mt=8",kAppID]

#define G_EvaluateURL    [NSString stringWithFormat:@"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@",kAppID]


//-------------------获取设备大小-------------------------


#pragma mark -获取系统Documents目录
#define G_systemDocuments  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]



#pragma mark -该宏定义是让 AFNetworking支持4.3所定义

/*因为我们工程支持 4.3，所以 weak, __weak 关键字不能用， 可以通过宏定义将 5.0 以下时 weak 关键字定义为 unsafe_unretained:*/

#if (!__has_feature(objc_arc)) || \
(defined __IPHONE_OS_VERSION_MIN_REQUIRED && \
__IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_5_0) || \
(defined __MAC_OS_X_VERSION_MIN_REQUIRED && \
__MAC_OS_X_VERSION_MIN_REQUIRED < __MAC_10_7)
#undef weak
#define weak unsafe_unretained
#undef __weak
#define __weak __unsafe_unretained
#endif


#pragma mark -判断是否为 ARC  在非ARC模式下 自定义内存释放 多了一个把变量置nil的步骤

#if __has_feature(objc_arc)
//compiling with ARC
#else

//释放一个对象
#define G_Safe_Delete(object) if(object) { [object release], object = nil; }
#define G_SafeRelease(object)    [object release];  object=nil
#endif

/*前两个打印日志宏定义  第一个是发布版本时屏蔽日志所用,第二个是在Debug模式下打印日志和当前行数*/
#pragma mark - 调试模式下输入NSLog，发布模式下屏蔽日志输出

#ifndef __OPTIMIZE__
#define NSLog(...)    NSLog(__VA_ARGS__)
#else
#define NSLog(...)
#endif

#endif
