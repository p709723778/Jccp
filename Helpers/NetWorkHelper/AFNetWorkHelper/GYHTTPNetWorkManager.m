//
//  GYHTTPNetWorkManager.m
//  Jccp
//
//  Created by Gary on 14-4-4.
//  Copyright (c) 2014年 蒲晓涛. All rights reserved.
//

#import "GYHTTPNetWorkManager.h"

@implementation GYHTTPNetWorkManager

GY_SINGLETON_FOR_CLASS(GYHTTPNetWorkManager);

- (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(NSDictionary *)parameters
                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
{
    return [[AFAppDotNetAPIClient sharedClient] POST:URLString parameters:parameters success:success failure:failure];
}

- (NSURLSessionDataTask *)GET:(NSString *)URLString
                    parameters:(NSDictionary *)parameters
                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                      failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
{
    return [[AFAppDotNetAPIClient sharedClient] GET:URLString parameters:parameters success:success failure:failure];
}
@end
