//
//  NSString+MD5.h
//  Jccp
//
//  Created by Gary on 14-2-18.
//  Copyright (c) 2014年 蒲晓涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MD5)

/**
 *  把字符串加密成32位小写md5字符串
 *
 *  @param inPutText 需要被加密的字符串
 *
 *  @return 加密后的32位小写md5字符串
 */
- (NSString *)md532BitLower;

/**
 *  把字符串加密成32位大写md5字符串
 *
 *  @param inPutText 需要被加密的字符串
 *
 *  @return 加密后的32位大写md5字符串
 */
- (NSString*)md532BitUpper;

@end
