//
//  NSObject+GYBlockTimer.h
//  Jccp
//
//  Created by Gary on 14-3-27.
//  Copyright (c) 2014年 蒲晓涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (GYBlockTimer)

/**
 *  本方法是用来计算某一段代码执行时间
 *
 *  @param prefixString 自定义输出前缀  如果为nil的时候,有默认的值
 */
- (void)logTimeTakenToRunBlock:(void (^)(void))block withPrefix:(NSString *)prefixString;

@end