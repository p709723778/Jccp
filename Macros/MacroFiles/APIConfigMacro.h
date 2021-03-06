//
//  APIMacro.h
//  Jccp
//
//  Created by Gary on 13-12-30.
//  Copyright (c) 2013年 蒲晓涛. All rights reserved.
//


/************************************
 *
 *该头文件是用来切换服务器地址所用
 *只需修改ServerAddressNumber 编号即可
 ************************************/

#ifndef Jccp_APIConfigMacro_h
#define Jccp_APIConfigMacro_h


#pragma mark -服务器地址配置

//服务器地址编号   方便切换测试服务器地址
#define API_ServerAddressNumber 1

//根据服务器地址编号 进行ServerAddress赋值(ServerAddress是服务器地址)
#if (API_ServerAddressNumber == 1) //正式服务器
#define API_ServerAddress  @"http://www-jucaicp-com-4evu8r2xe8a3.runscope.net/"

#elif (API_ServerAddressNumber == 2)//测试服务器
#define API_ServerAddress  @"http://192.168.1.93"

#endif


#pragma mark -返回整个服务器请求地址

/**
 *	@brief	该方法是返回整个服务器请求地址
 *
 *	@param 	Action_API 	操作API地址
 *
 *	@return	整个服务器请求地址
 *
 *  特此声明   这是是给之前的ASI网络请求做的一个 API组合
 *            当AFNetworking这个框架出来以后,它有自己的一个api组合管理
 *            如果项目用的是这个框架,就没有必要用该组合了
 */

#define API_ServerURL_Request(API_Action) [NSString stringWithFormat:@"%@%@",API_ServerAddress,API_Action]



#pragma mark -服务器返回数据格式类型设置

//向服务器请求返回格式编号
#define API_SERVER_RETURN_FORMAT_NUMBER 2

#if (API_SERVER_RETURN_FORMAT_NUMBER == 1) //返回XML格式的数据
#define API_SERVER_RETURN_FORMAT @"XML"

#elif (API_SERVER_RETURN_FORMAT_NUMBER == 2) //返回JSON格式的数据
#define API_SERVER_RETURN_FORMAT @"JSON"
#endif

#endif
