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

/**
 *  GET请求
 *
 *  @param URLString  URL网址
 *  @param parameters 参数
 *  @param success    成功后执行代码块
 *  @param failure    失败后执行代码块
 *
 *  @return NSURLSessionDataTask
 */
- (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(NSDictionary *)parameters
                      success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                      failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

/**
 *  POST请求
 *
 *  @param URLString  URL网址
 *  @param parameters 参数
 *  @param success    成功后执行代码块
 *  @param failure    失败后执行代码块
 *
 *  @return NSURLSessionDataTask
 */
- (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(NSDictionary *)parameters
                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

/**
 *  获取网络状态
 *
 *  @return 状态
 */
+ (NetworkStatus)networkStatus;

@end
