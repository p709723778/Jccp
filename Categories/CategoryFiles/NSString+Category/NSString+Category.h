//
//  NSString+Category.h
//  Jccp
//
//  Created by Gary on 14-2-18.
//  Copyright (c) 2014年 蒲晓涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Category)

// int转换
+ (NSString *)integerToString:(int)i;

// float转换
+ (NSString *)floatToString:(float)f;

/* 去掉两端空格和换行符 */
- (NSString *)stringByTrimmingBlank;

@end
