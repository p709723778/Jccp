//
//  APIRequestMacro.h
//  Jccp
//
//  Created by Gary on 13-12-30.
//  Copyright (c) 2013年 蒲晓涛. All rights reserved.
//


/****************************
 * 该头文件是用来定义服务器操作API和服务器返回数据格式
 ***************************/

#ifndef Jccp_APIRequestMacro_h
#define Jccp_APIRequestMacro_h

//此处是一个demo

#pragma mark -用户登陆

#define API_Request_UserLogin [NSString stringWithFormat:@"?c=api_user&a=login&callType=%@&Y-KEY=%@",API_SERVER_RETURN_FORMAT, API_Operate_KEY]

#endif
