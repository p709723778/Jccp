//
//  ColorMacro.h
//  Jccp
//
//  Created by Gary on 13-12-31.
//  Copyright (c) 2013年 蒲晓涛. All rights reserved.
//

#ifndef Jccp_ColorMacro_h
#define Jccp_ColorMacro_h

#pragma mark -颜色设置已经在扩展类已经实现,根据个人爱好选择呗

// rgb颜色转换（16进制->10进制）
#define G_UIColorFromRGB(rgbValue)    [UIColor colorWithRed : ((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green : ((float)((rgbValue & 0xFF00) >> 8)) / 255.0 blue : ((float)(rgbValue & 0xFF)) / 255.0 alpha : 1.0]

// RGBA的颜色设置
#define G_COLOR(R, G, B, A)           [UIColor colorWithRed : R / 255.0 green : G / 255.0 blue : B / 255.0 alpha : A]

// RGB颜色设置
#define G_RGBA(r, g, b, a)            [UIColor colorWithRed : r / 255.0f green : g / 255.0f blue : b / 255.0f alpha : a]
#define RGB(r, g, b)                RGBA(r, g, b, 1.0f)

// 清除背景色
#define G_CLEARCOLOR [UIColor clearColor]

#define G_RGBCOLOR(r, g, b)       [UIColor colorWithRed : (r) / 255.0f green : (g) / 255.0f blue : (b) / 255.0f alpha : 1]

#define G_RGBACOLOR(r, g, b, a)   [UIColor colorWithRed : (r) / 255.0f green : (g) / 255.0f blue : (b) / 255.0f alpha : (a)]

#endif