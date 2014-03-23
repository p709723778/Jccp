//
//  GYRespondCodeUtility.h
//  Jccp
//
//  Created by Gary on 14-3-22.
//  Copyright (c) 2014年 蒲晓涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GYRespondCodeUtility : NSObject

/**
 *  根据服务器响应码获取对应的信息
 *
 *  @param apiCode 服务器响应码
 *
 *  @return 对应信息
 */
+ (NSString *)ServerRespondWithAPICode:(NSString *)apiCode;

@end
