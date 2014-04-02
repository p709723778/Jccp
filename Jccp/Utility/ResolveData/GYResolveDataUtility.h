//
//  GYResolveDataUtility.h
//  Jccp
//
//  Created by Gary on 14-4-1.
//  Copyright (c) 2014年 蒲晓涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GYResolveDataUtility : NSObject

/**
 *  把服务器返回的NSData数据进行处理
 *
 *  @param JSONData NSData格式数据
 *
 *  @return NSDictionary字典类型
 */
+ (NSDictionary *)dictionaryWitData:(id)JSONData;

@end
