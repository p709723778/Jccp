//
//  GYBase64.m
//  Jccp
//
//  Created by Gary on 14-4-15.
//  Copyright (c) 2014年 蒲晓涛. All rights reserved.
//

#import "GYBase64Tool.h"

@implementation GYBase64Tool

+ (NSString *)encodeBase64String:(NSString *)inputString
{
    NSData      *base64Data = [inputString dataUsingEncoding:NSUTF8StringEncoding];
    NSString    *base64String = [base64Data base64EncodedStringWithOptions:0];
    
    return base64String;
}

+ (NSString *)decodeBase64String:(NSString *)inputString
{
    NSData *base64Data = [[NSData alloc] initWithBase64EncodedString:inputString options:0];
    
    NSString *base64String = [[NSString alloc] initWithData:base64Data encoding:NSUTF8StringEncoding];
    
    return base64String;
}

+ (NSData *)encodeBase64Data:(NSData *)inputData
{
    NSData *dataFromData = [inputData base64EncodedDataWithOptions:0];
    
    return dataFromData;
}

+ (NSData *)decodeBase64Data:(NSData *)inputData
{
    NSData *dataFromData = [[NSData alloc] initWithBase64EncodedData:inputData options:0];
    
    return dataFromData;
}

+ (NSString *)encodeBase64StringWithData:(NSData *)inputData
{
    NSString *base64String = [inputData base64EncodedStringWithOptions:0];
    
    return base64String;
}

+ (NSString *)decodeBase64StringWithData:(NSData *)inputData
{
    NSString *base64String = [[NSString alloc] initWithData:inputData encoding:NSUTF8StringEncoding];
    
    return base64String;
}

+ (NSData *)encodeBase64DataWithString:(NSString *)inputString
{
    NSData  *data = [inputString dataUsingEncoding:NSUTF8StringEncoding];
    NSData  *base64Data = [data base64EncodedDataWithOptions:0];
    
    return base64Data;
}

+ (NSData *)decodeBase64DataWithString:(NSString *)inputString
{
    NSData *base64Data = [[NSData alloc] initWithBase64EncodedString:inputString options:0];
    
    return base64Data;
}

@end
