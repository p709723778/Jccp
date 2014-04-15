//
//  NSData+AES.h
//  Jccp
//
//  Created by Gary on 14-4-15.
//  Copyright (c) 2014年 蒲晓涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (AES)

/**
 *  数据加密
 *
 *  @param key 密钥
 *
 *  @return 加密数据
 */
- (NSData *)AES256EncryptWithKey:(NSString *)key;

/**
 *  数据解密
 *
 *  @param key 密钥
 *
 *  @return 解密数据
 */
- (NSData *)AES256DecryptWithKey:(NSString *)key;

@end
