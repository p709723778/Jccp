//
//  NSString+JSONCategory.m
//  Jccp
//
//  Created by Gary on 14-2-18.
//  Copyright (c) 2014年 蒲晓涛. All rights reserved.
//

#import "NSString+JSONCategory.h"

@implementation NSString (JSONCategory)

- (id)JSONValue
{
    NSData                  *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    __autoreleasing NSError *error = nil;
    id                      result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    if (error != nil) {
        return nil;
    }
    
    return result;
}

@end
