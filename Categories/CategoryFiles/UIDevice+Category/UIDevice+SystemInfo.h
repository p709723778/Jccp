//
//  UIDevice+SystemInfo.h
//  Architecture
//
//  Created by 蒲晓涛 on 8/3/13.
//  Copyright (c) 2013 Gary. All rights reserved.
//


/**
 *	@brief	判断当前系统是否为那个版本
 *
 *	@param 	 	compare: OS系统版本参数
 *
 *	@return	YES Or NO
 */
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)


#define IOS7_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )
#define IOS6_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"6.0"] != NSOrderedAscending )
#define IOS5_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"5.0"] != NSOrderedAscending )
#define IOS4_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"4.0"] != NSOrderedAscending )
#define IOS3_OR_LATER	( [[[UIDevice currentDevice] systemVersion] compare:@"3.0"] != NSOrderedAscending )

#else	// #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)

#define IOS6_OR_LATER	(NO)
#define IOS5_OR_LATER	(NO)
#define IOS4_OR_LATER	(NO)
#define IOS3_OR_LATER	(NO)

#endif	// #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)

@interface UIDevice (SystemInfo)

//获取操作系统版本号
+ (NSString *)SystemVersion;

//获取操作系统版本 包括设备操作系统名称
+ (NSString *)OSVersion;

/**
 *获取当前系统语言
 * en:英文  zh-Hans:简体中文   zh-Hant:繁体中文    ja:日本
 */
+ (NSString*)OSLanguage;

//获取App版本
+ (NSString *)appVersion;

//获取appID BundleID 例如:com.XX.XX
+ (NSString *)appIdentifier;

//获取当前设备名称    比如: iPad, iPhone, iPod, iPad Simulator等
+ (NSString *)deviceModel;

//是否越狱
+ (BOOL)isJailBroken		NS_AVAILABLE_IOS(4_0);

//此方法只针对实现越狱的真机iPhone
+ (NSString *)jailBreaker	NS_AVAILABLE_IOS(4_0);

+ (BOOL)isDevicePhone;
+ (BOOL)isDevicePad;

+ (BOOL)isRetina;

+ (BOOL)isPhone35;            //iPhone4
+ (BOOL)isPhoneRetina35;      //iPhone4S
+ (BOOL)isPhoneRetina4;       //iPhone5

+ (BOOL)isPad;
+ (BOOL)isPadRetina;


/**
 *	@brief	判断传入的分辨率是否为当前设备的分辨率
 *
 *	@param 	size 	分辨率变量
 *
 *	@return	YES Or NO
 */
+ (BOOL)isScreenSize:(CGSize)size;

@end
