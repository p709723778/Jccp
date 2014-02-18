//
//  NSString+Category.m
//  Jccp
//
//  Created by Gary on 14-2-18.
//  Copyright (c) 2014年 蒲晓涛. All rights reserved.
//

#import "NSString+Category.h"

@implementation NSString (Category)

#pragma mark - 其他类型转换为NSString

+ (NSString *)integerToString:(int)i
{
    return [NSString stringWithFormat:@"%d", i];
}

+ (NSString *)floatToString:(float)f
{
    return [NSString stringWithFormat:@"%f", f];
}

- (NSString *)stringByTrimmingBlank
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end
