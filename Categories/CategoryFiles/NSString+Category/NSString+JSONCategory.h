//
//  NSString+JSONCategory.h
//  Jccp
//
//  Created by Gary on 14-2-18.
//  Copyright (c) 2014年 蒲晓涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JSONCategory)

/**
 *  NSString类型的JSON格式数据 转换 id类型
 *
 *  @return id类型数据
 */

- (id)JSONValue;

@end
