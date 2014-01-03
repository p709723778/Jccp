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

#define G_AppDelegate        (AppDelegate *)[[UIApplication sharedApplication] delegate]
#define G_NavigationController ((AppDelegate *)[UIApplication sharedApplication].delegate.navigationController)
#define G_Window             [[[UIApplication sharedApplication] windows] lastObject]
#define G_KeyWindow          [[UIApplication sharedApplication] keyWindow]
#define G_UserDefaults       [NSUserDefaults standardUserDefaults]
#define G_NotificationCenter [NSNotificationCenter defaultCenter]



//----------------------其他----------------------------

//判断是否为 闰年
#define  G_IS_LEAP_YEAR(y)  y%4==0&&y%100!=0||y%400==0

#pragma mark -设置View的tag属性
//设置View的tag属性
#define G_VIEWWITHTAG(_OBJECT, _TAG)    [_OBJECT viewWithTag : _TAG]


//拨打电话
#define G_canTel                 ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tel:"]])
#define G_tel(phoneNumber)       ([[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",phoneNumber]]])
#define G_telprompt(phoneNumber) ([[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"telprompt:%@",phoneNumber]]])

//打开URL
#define G_canOpenURL(appScheme) ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:appScheme]])
#define G_openURL(appScheme) ([[UIApplication sharedApplication] openURL:[NSURL URLWithString:appScheme]])

//读取文件的文本内容,默认编码为UTF-8
#define G_FileString(name,ext)            [[NSString alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(name) ofType:(ext)] encoding:NSUTF8StringEncoding error:nil]
#define G_FileDictionary(name,ext)        [[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(name) ofType:(ext)]]
#define G_FileArray(name,ext)             [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:(name) ofType:(ext)]]


//System  剪贴板
#define G_PasteString(string)   [[UIPasteboard generalPasteboard] setString:string];
#define G_PasteImage(image)     [[UIPasteboard generalPasteboard] setImage:image];


#pragma mark -度弧度转换
#define G_DegreesToRadian(degrees)      (M_PI * (degrees) / 180.0)
#define G_RadianToDegrees(radians) (radians * 180.0) / (M_PI)



#pragma mark ---------------------------------非宏定义缩写方法--------------------

//判断对象是否为空
static inline BOOL isEmpty(id thing)
{
    return thing == nil
    || ([thing respondsToSelector:@selector(length)] && [(NSData *)thing length] == 0)
    || ([thing respondsToSelector:@selector(count)] && [(NSArray *)thing count] == 0);
}

//生成随机guid串的代码
static inline CFStringRef createUniqueString(void)
{
    CFUUIDRef uuid = CFUUIDCreate(NULL);
    CFStringRef uuidStringRef = CFUUIDCreateString(NULL, uuid);
    CFRelease(uuid);
    return uuidStringRef;
}

#endif
