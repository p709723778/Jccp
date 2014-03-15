//
//  UIDevice+UDID.h
//  Jccp
//
//  Created by Gary on 14-3-15.
//  Copyright (c) 2014年 蒲晓涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (UDID)

//广告标示符（IDFA-identifierForIdentifier）
+ (NSString *)deviceAdvertiserID;

//Vindor标示符
+ (NSString *)deviceIdentifierForVendor;

//获取CFUUID
+ (NSString *)deviceCFUUID;

//获取NSUUID
+ (NSString *)deviceNSUUID;

@end
