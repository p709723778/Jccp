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

- (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(NSDictionary *)parameters
                      success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                      failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
{
    return [[AFAppDotNetAPIClient sharedClient] GET:URLString parameters:parameters success:success failure:failure];
}

- (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(NSDictionary *)parameters
                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure
{
    return [[AFAppDotNetAPIClient sharedClient] POST:URLString parameters:parameters success:success failure:failure];
}

+ (NetworkStatus)networkStatus
{
    Reachability *reachability = [Reachability reachabilityWithHostname:API_ServerAddress];
    // NotReachable     - 没有网络连接
    // ReachableViaWWAN - 移动网络(2G、3G)
    // ReachableViaWiFi - WIFI网络
    return [reachability currentReachabilityStatus];
}
@end
