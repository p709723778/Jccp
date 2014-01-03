//
//  MacroFilesManager.h
//  Jccp
//
//  Created by Gary on 13-12-30.
//  Copyright (c) 2013年 蒲晓涛. All rights reserved.
//


/**
 *  宏定义引入  / 非宏定义引入(如:分类,工具等)
 */
#ifndef Jccp_MacroFilesManager_h
#define Jccp_MacroFilesManager_h


#pragma mark -宏定义头文件管理

//宏定义
#import "APIConfigMacro.h"
#import "APIRequestMacro.h"
#import "AppConfigMacro.h"
#import "ShorthandMethodMacro.h"
#import "SingletonMacro.h"
#import "ColorMacro.h"
#import "LogMacro.h"
#import "FontMacro.h"
#import "GCDMacro.h"
#import "ImageMacro.h"


#pragma mark -非宏定义文件管理

//分类
#import "CategoryManager.h"

//辅助
#import "HelperManager.h"

//工具
#import "ToolsManager.h"


#endif
