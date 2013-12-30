//
//  RequestAddressMacro.h
//  Jccp
//
//  Created by Gary on 13-12-30.
//  Copyright (c) 2013年 蒲晓涛. All rights reserved.
//


/****************************
 * 该头文件是用来定义服务器操作API和服务器返回数据格式
 ***************************/

#ifndef Jccp_RequestAddressMacro_h
#define Jccp_RequestAddressMacro_h

//此处是一个demo

#pragma mark -用户登陆

#define Server_Action_UserLogin [NSString stringWithFormat:@"/?c=api_user&a=login&callType=%@&Y-KEY=%@",SERVER_RETURN_FORMAT, Operate_KEY]

#endif
