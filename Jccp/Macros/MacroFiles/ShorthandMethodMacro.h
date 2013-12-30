//
//  ShorthandMethodMacro.h
//  Jccp
//
//  Created by Gary on 13-12-30.
//  Copyright (c) 2013年 蒲晓涛. All rights reserved.
//

#ifndef Jccp_ShorthandMethodMacro_h
#define Jccp_ShorthandMethodMacro_h

#pragma mark - 简写系统中一些方法

#define kAppDelegate        (AppDelegate *)[[UIApplication sharedApplication] delegate]
#define kNavigationController ((AppDelegate *)[UIApplication sharedApplication].delegate.navigationController)
#define kWindow             [[[UIApplication sharedApplication] windows] lastObject]
#define kKeyWindow          [[UIApplication sharedApplication] keyWindow]
#define kUserDefaults       [NSUserDefaults standardUserDefaults]
#define kNotificationCenter [NSNotificationCenter defaultCenter]

#pragma mark -判断是否为 ARC  在非ARC模式下 自定义内存释放 多了一个把变量置nil的步骤

#if __has_feature(objc_arc)
//compiling with ARC
#else

//释放一个对象
#define kSafe_Delete(object) if(object) { [object release], object = nil; }
#define kSafeRelease(object)    [object release];  object=nil
#endif

#pragma mark - 读取图片
//----------------------图片----------------------------
//如果在程序中经常需要重用的图片，那么最好是选择imageNamed方法

//读取本地图片
#define LoadImage(file) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[file stringByDeletingPathExtension] ofType:[file pathExtension]]]

//定义UIImage对象
#define Image(A) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]

//定义UIImage对象
#define ImageNamed(imageName) [UIImage imageNamed:imageName]


//可拉伸的图片

#define ResizableImage(name,top,left,bottom,right) [[UIImage imageNamed:name] resizableImageWithCapInsets:UIEdgeInsetsMake(top,left,bottom,right)]
#define ResizableImageWithMode(name,top,left,bottom,right,mode) [[UIImage imageNamed:name] resizableImageWithCapInsets:UIEdgeInsetsMake(top,left,bottom,right) resizingMode:mode]

//----------------------图片----------------------------


#pragma mark -颜色设置已经在扩展类已经实现,根据个人爱好选择呗
//----------------------颜色类---------------------------
// rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//RGBA的颜色设置
#define COLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

//RGB颜色设置
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)

//清除背景色
#define CLEARCOLOR [UIColor clearColor]

#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

//----------------------颜色类--------------------------


//----------------------其他----------------------------

#pragma mark -方正黑体简体字体定义
//方正黑体简体字体定义
#define FONT(F) [UIFont fontWithName:@"FZHTJW--GB1-0" size:F]

//针对数字和字符显示电子样式
#define Digital_7(s)          [UIFont fontWithName:@"Digital-7 Mono" size:s]


#pragma mark -设置View的tag属性
//设置View的tag属性
#define VIEWWITHTAG(_OBJECT, _TAG)    [_OBJECT viewWithTag : _TAG]

#pragma mark -打印位置,大小
//打印位置,大小
#ifdef DEBUG
#define DNSLogPoint(p) NSLog(@&quot;%f,%f&quot;, p.x, p.y);
#define DNSLogSize(p) NSLog(@&quot;%f,%f&quot;, p.width, p.height);
#define DNSLogRect(p) NSLog(@&quot;%f,%f,%f,%f&quot;, p.origin.x, p.origin.y, p.size.width, p.size.height,);
#else
#define DNSLogPoint(p);
#define DNSLogSize(p);
#define DNSLogRect(p);
#endif

//拨打电话
#define canTel                 ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tel:"]])
#define tel(phoneNumber)       ([[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",phoneNumber]]])
#define telprompt(phoneNumber) ([[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"telprompt:%@",phoneNumber]]])

//打开URL
#define canOpenURL(appScheme) ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:appScheme]])
#define openURL(appScheme) ([[UIApplication sharedApplication] openURL:[NSURL URLWithString:appScheme]])

//读取文件的文本内容,默认编码为UTF-8
#define FileString(name,ext)            [[NSString alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(name) ofType:(ext)] encoding:NSUTF8StringEncoding error:nil]
#define FileDictionary(name,ext)        [[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(name) ofType:(ext)]]
#define FileArray(name,ext)             [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(name) ofType:(ext)]]


//System  剪贴板
#define PasteString(string)   [[UIPasteboard generalPasteboard] setString:string];
#define PasteImage(image)     [[UIPasteboard generalPasteboard] setImage:image];


#pragma mark - G－C－D

#define kGCDBackground(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define kGCDMain(block)       dispatch_async(dispatch_get_main_queue(),block)


#pragma mark -度弧度转换
#define GY_DegreesToRadian(degrees)      (M_PI * (degrees) / 180.0)
#define GY_RadianToDegrees(radians) (radians * 180.0) / (M_PI)

#endif
