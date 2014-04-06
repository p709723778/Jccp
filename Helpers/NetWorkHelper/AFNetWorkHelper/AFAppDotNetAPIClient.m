// AFAppDotNetAPIClient.h
//
// Copyright (c) 2012 Mattt Thompson (http://mattt.me/)
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "AFAppDotNetAPIClient.h"

static NSString * const AFAppDotNetAPIBaseURLString = API_ServerAddress;

@implementation AFAppDotNetAPIClient

+ (instancetype)sharedClient {
    static AFAppDotNetAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        [config setHTTPAdditionalHeaders:@{ @"User-Agent" : @"Jccp IOS 1.0.0"}];
        [config setHTTPAdditionalHeaders:@{ @"Client-Source" : @"IOS"}];
        
        //设置我们的缓存大小 其中内存缓存大小设置10M  磁盘缓存5M
        NSURLCache *cache = [[NSURLCache alloc] initWithMemoryCapacity:10 * 1024 * 1024
                                                          diskCapacity:50 * 1024 * 1024
                                                              diskPath:nil];
        [config setURLCache:cache];
        
        _sharedClient = [[AFAppDotNetAPIClient alloc] initWithBaseURL:[NSURL URLWithString:AFAppDotNetAPIBaseURLString] sessionConfiguration:config];
        
        /**
         *  设置服务器序列化格式
         *  AFHTTPResponseSerializer 返回的是NSData格式
         *  AFJSONResponseSerializer 返回的是id格式
         *  AFXMLParserResponseSerializer  返回的是NSXMLParser格式对象
         *  在此为了通用XML和JSON格式  我这里用到的是AFHTTPResponseSerializer
         */
        _sharedClient.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        //安全策略 SSL公匙
        [_sharedClient setSecurityPolicy:[AFSecurityPolicy policyWithPinningMode:AFSSLPinningModePublicKey]];
        //设置Content-Type
        _sharedClient.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
        
        
    });
    
    return _sharedClient;
}

@end
