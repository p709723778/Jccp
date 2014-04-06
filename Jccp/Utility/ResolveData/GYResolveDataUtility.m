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
        @try {
            attributes = [GYJSONUtility objectFromJSONData:JSONData];
        }
        @catch(NSException *exception) {
            NSLog(@"%s [Line %d] JSON转换NSDictionary数据格式有误!-->\n%@",__PRETTY_FUNCTION__, __LINE__,exception);
        }

        @finally {}
    } else if ([API_SERVER_RETURN_FORMAT isEqualToString:@"XML"]) {
        @try {
            XMLDictionaryParser *xmlDictionaryParser = [XMLDictionaryParser sharedInstance];
            xmlDictionaryParser.trimWhiteSpace = NO;
            xmlDictionaryParser.nodeNameMode = XMLDictionaryNodeNameModeNever;
            xmlDictionaryParser.attributesMode = XMLDictionaryAttributesModeUnprefixed;
            attributes = [NSDictionary dictionaryWithXMLString:[[NSString alloc] initWithData:JSONData encoding:NSUTF8StringEncoding]];
        }
        @catch(NSException *exception) {
            NSLog(@"%s [Line %d] XML转换NSDictionary数据格式有误!-->\n%@",__PRETTY_FUNCTION__, __LINE__,exception);
        }

        @finally {}

        if (attributes == nil) {
            NSLog(@"XML转换NSDictionary数据格式有误!");
        }
    } else {
        NSLog(@"服务器设置解析数据格式有误");
    }

    return attributes;
}

@end