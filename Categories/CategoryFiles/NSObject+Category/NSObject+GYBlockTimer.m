//
//  NSObject+GYBlockTimer.m
//  Jccp
//
//  Created by Gary on 14-3-27.
//  Copyright (c) 2014年 蒲晓涛. All rights reserved.
//

#import "NSObject+GYBlockTimer.h"

@implementation NSObject (GYBlockTimer)

- (void)logTimeTakenToRunBlock:(void (^)(void))block withPrefix:(NSString *)prefixString
{
    double a = CFAbsoluteTimeGetCurrent();

    block();
    double b = CFAbsoluteTimeGetCurrent();

    unsigned int m = ((b - a) * 1000.0f); // convert from seconds to milliseconds

    NSLog(@"%@: %d ms", prefixString ? prefixString : @"Time taken", m);
}


//下面是使用方法  把你执行的代码写进方法中间就ok
/*
[self logTimeTakenToRunBlock:^{
    
    // your time consuming piece of code here
    for(int i = 0 ; i &lt; 1000000000; i ++);
    
} withPrefix:@"For Loop"];
 
 */

@end