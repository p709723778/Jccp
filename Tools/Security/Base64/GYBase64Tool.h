//
//  GYBase64.h
//  Jccp
//
//  Created by Gary on 14-4-15.
//  Copyright (c) 2014年 蒲晓涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GYBase64Tool : NSObject

///将字符串转换为Base64编码字符串
+ (NSString *)encodeBase64String:(NSString *)inputString;

///将Base64编码字符串转换为字符串
+ (NSString *)decodeBase64String:(NSString *)inputString;

///将Data转换为Base64编码Data
+ (NSData *)encodeBase64Data:(NSData *)inputData;

///将Base64编码Data转换为Data
+ (NSData *)decodeBase64Data:(NSData *)inputData;

///将Data转换为Base64编码字符串
+ (NSString *)encodeBase64StringWithData:(NSData *)inputData;

///将Base64编码Data转换为字符串
+ (NSString *)decodeBase64StringWithData:(NSData *)inputData;

///将字符串转换为Base64编码Data
+ (NSData *)encodeBase64DataWithString:(NSString *)inputString;

///将Base64编码字符串转换为Data
+ (NSData *)decodeBase64DataWithString:(NSString *)inputString;

@end
