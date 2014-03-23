//
//  GYRespondCodeUtility.m
//  Jccp
//
//  Created by Gary on 14-3-22.
//  Copyright (c) 2014年 蒲晓涛. All rights reserved.
//

#import "GYRespondCodeUtility.h"

@implementation GYRespondCodeUtility

+ (NSString *)ServerRespondWithAPICode:(NSString *)apiCode
{
    //如果响应码为空值 则返回空值
    if ([apiCode isEqualToString:@""] || [apiCode isEqual:[NSNull null]] || apiCode == nil) {
        return @"";
    }
    
    NSDictionary *allRespondCodeDic = GY_FileDictionary(@"APIRespondCode", @"plist");
    NSDictionary *apiCodeDic = [allRespondCodeDic objectForKey:apiCode];
    
    if ([apiCodeDic isEqual:[NSNull null]] || apiCodeDic == nil) {
        NSLog(@"在%@类里的%@方法-------找不到相关响应信息",[[NSString stringWithUTF8String:__FILE__] lastPathComponent],NSStringFromSelector(_cmd));
        return @"";
    }
    return [apiCodeDic objectForKey:@"msg"];
}

@end
