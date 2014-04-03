//
//  GYResolveDataUtility.m
//  Jccp
//
//  Created by Gary on 14-4-1.
//  Copyright (c) 2014年 蒲晓涛. All rights reserved.
//

#import "GYResolveDataUtility.h"

#import "GYJSONUtility.h"
#import "XMLDictionary.h"

@implementation GYResolveDataUtility

+ (NSDictionary *)dictionaryWithData:(id)JSONData
{
    NSDictionary *attributes = nil;

    if ([API_SERVER_RETURN_FORMAT isEqualToString:@"JSON"]) {
        attributes = [GYJSONUtility objectFromJSONData:JSONData];
    } else if ([API_SERVER_RETURN_FORMAT isEqualToString:@"XML"]) {
        XMLDictionaryParser *xmlDictionaryParser = [XMLDictionaryParser sharedInstance];
        xmlDictionaryParser.trimWhiteSpace = NO;
        xmlDictionaryParser.nodeNameMode = XMLDictionaryNodeNameModeNever;
        attributes = [NSDictionary dictionaryWithXMLString:[[NSString alloc] initWithData:JSONData encoding:NSUTF8StringEncoding]];

        if (attributes == nil) {
            NSLog(@"XML转换NSDictionary数据格式有误!");
        }
    } else {
        NSLog(@"解析数据格式有误");
    }

    return attributes;
}

@end