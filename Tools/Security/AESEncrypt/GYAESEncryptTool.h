//
//  GYAESEncrypt.h
//  Jccp
//
//  Created by Gary on 14-4-15.
//  Copyright (c) 2014年 蒲晓涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GYAESEncryptTool : NSObject

/**
 *  将string转成带密码的data
 *
 *  @param string 加密的数据
 *
 *  @return 加密后的数据
 */
+ (NSData*)encryptAESData:(NSString*)string;

/**
 *  将带密码的data转成string
 *
 *  @param data 加密的数据
 *
 *  @return 加密后的数据
 */
+ (NSString*)decryptAESData:(NSData*)data;

@end
