//
//  GYHTTPNetWorkManager.h
//  Jccp
//
//  Created by Gary on 14-4-4.
//  Copyright (c) 2014年 蒲晓涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GYHTTPNetWorkManager : NSObject

GY_SINGLETON_FOR_HEADER(GYHTTPNetWorkManager);

- (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(NSDictionary *)parameters
                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

- (NSURLSessionDataTask *)GET:(NSString *)URLString
                    parameters:(NSDictionary *)parameters
                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;
@end
