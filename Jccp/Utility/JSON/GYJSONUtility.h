//
//  GYJSONUtility.h
//  Jccp
//
//  Created by Gary on 14-3-20.
//  Copyright (c) 2014年 蒲晓涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GYJSONUtility : NSObject

/**
 *   Converts a given JSON String to an object
 *
 *   @param jsonString the JSON String
 *   @return The converted object; otherwise NIL
 */
+ (id)objectFromJSONString:(NSString *)jsonString;

/**
 *   Converts given JSON Data to an object
 *
 *   @param jsonData the JSON Data
 *   @return The converted object; otherwise NIL
 */
+ (id)objectFromJSONData:(NSData *)jsonData;

/**
 *   Converts given Object an JSON String
 *
 *   @param object the Object that should be converted
 *   @return The converted JSON String; otherwise NIL
 */
+ (NSString *)JSONStringFromObject:(id)object;

@end
