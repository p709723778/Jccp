//
//  ImageMacro.h
//  Jccp
//
//  Created by Gary on 13-12-31.
//  Copyright (c) 2013年 蒲晓涛. All rights reserved.
//

#ifndef Jccp_ImageMacro_h
#define Jccp_ImageMacro_h

#pragma mark - 读取图片

// 如果在程序中经常需要重用的图片，那么最好是选择imageNamed方法

// 读取本地图片
#define G_LoadImage(file)         [UIImage imageWithContentsOfFile :[[NSBundle mainBundle] pathForResource:[file stringByDeletingPathExtension] ofType:[file pathExtension]]]

// 定义UIImage对象
#define G_Image(A)                [UIImage imageWithContentsOfFile :[[NSBundle mainBundle] pathForResource:A ofType:nil]]

// 定义UIImage对象
#define G_ImageNamed(imageName)   [UIImage imageNamed : imageName]

// 可拉伸的图片

#define G_ResizableImage(name, top, left, bottom, right)                  [[UIImage imageNamed:name] resizableImageWithCapInsets : UIEdgeInsetsMake(top, left, bottom, right)]

#define G_ResizableImageWithMode(name, top, left, bottom, right, mode)    [[UIImage imageNamed:name] resizableImageWithCapInsets : UIEdgeInsetsMake(top, left, bottom, right) resizingMode : mode]

#endif