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

#define dWidth [UIScreen mainScreen].currentMode.size.width
#define dheight [UIScreen mainScreen].currentMode.size.height

//-------------------获取设备大小-------------------------
#pragma mark - 获取设备不同部位的高度

//获取屏幕高度(包含状态栏,导航栏,选项卡等),即:整个屏幕的高度
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height

//获取屏幕宽度 即:整屏的宽度
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width

#define StateBarHeight 20//获取状态栏的高度
#define NavBarHeight   44  //导航栏高度
#define TabBarHeight   49  //底部选项卡高度
#define MainHeight (ScreenHeight - StateBarHeight)//减去状态栏屏幕高度
#define MainWidth ScreenWidth//主屏宽度

//-------------------获取设备大小-------------------------


#pragma mark - 获取系统Documents目录
#define systemDocuments  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]



//-------------------打印日志-------------------------

/*前两个打印日志宏定义  第一个是发布版本时屏蔽日志所用,第二个是在Debug模式下打印日志和当前行数*/
#pragma mark - 调试模式下输入NSLog，发布后不再输入

#ifndef __OPTIMIZE__
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...) {}
#endif


//重写NSLog,Debug模式下打印日志和当前行数

//#if DEBUG
//#define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
//#else
//#define NSLog(FORMAT, ...) nil
//#endif

//DEBUG  模式下打印日志,当前行
#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

//DEBUG  模式下打印日志,当前行 并弹出一个警告
#ifdef DEBUG
#   define ULog(fmt, ...)  { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%s\n [Line %d] ", __PRETTY_FUNCTION__, __LINE__] message:[NSString stringWithFormat:fmt, ##__VA_ARGS__]  delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil]; [alert show]; }
#else
#   define ULog(...)
#endif

#define ITTDEBUG
#define ITTLOGLEVEL_INFO     10
#define ITTLOGLEVEL_WARNING  3
#define ITTLOGLEVEL_ERROR    1

#ifndef ITTMAXLOGLEVEL

#ifdef DEBUG
#define ITTMAXLOGLEVEL ITTLOGLEVEL_INFO
#else
#define ITTMAXLOGLEVEL ITTLOGLEVEL_ERROR
#endif

#endif

// The general purpose logger. This ignores logging levels.
#ifdef ITTDEBUG
#define ITTDPRINT(xx, ...)  NSLog(@"%s(%d): " xx, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define ITTDPRINT(xx, ...)  ((void)0)
#endif

// Prints the current method's name.
#define ITTDPRINTMETHODNAME() ITTDPRINT(@"%s", __PRETTY_FUNCTION__)

// Log-level based logging macros.
#if ITTLOGLEVEL_ERROR <= ITTMAXLOGLEVEL
#define ITTDERROR(xx, ...)  ITTDPRINT(xx, ##__VA_ARGS__)
#else
#define ITTDERROR(xx, ...)  ((void)0)
#endif

#if ITTLOGLEVEL_WARNING <= ITTMAXLOGLEVEL
#define ITTDWARNING(xx, ...)  ITTDPRINT(xx, ##__VA_ARGS__)
#else
#define ITTDWARNING(xx, ...)  ((void)0)
#endif

#if ITTLOGLEVEL_INFO <= ITTMAXLOGLEVEL
#define ITTDINFO(xx, ...)  ITTDPRINT(xx, ##__VA_ARGS__)
#else
#define ITTDINFO(xx, ...)  ((void)0)
#endif

#ifdef ITTDEBUG
#define ITTDCONDITIONLOG(condition, xx, ...) { if ((condition)) { \
ITTDPRINT(xx, ##__VA_ARGS__); \
} \
} ((void)0)
#else
#define ITTDCONDITIONLOG(condition, xx, ...) ((void)0)
#endif

#define ITTAssert(condition, ...)                                       \
do {                                                                      \
if (!(condition)) {                                                     \
[[NSAssertionHandler currentHandler]                                  \
handleFailureInFunction:[NSString stringWithUTF8String:__PRETTY_FUNCTION__] \
file:[NSString stringWithUTF8String:__FILE__]  \
lineNumber:__LINE__                                  \
description:__VA_ARGS__];                             \
}                                                                       \
} while(0)

//---------------------打印日志--------------------------


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


#pragma mark - App Id , 下载地址 , 评价地址

#define kAppID      @"593499239"

#define kAppDownloadURL     [NSString stringWithFormat:@"https://itunes.apple.com/us/app/ling-hao-xian/id%@?ls=1&mt=8",kAppID]

#define kEvaluateURL    [NSString stringWithFormat:@"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@",kAppID]

#endif
