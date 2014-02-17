//
//  UIViewController+Shake.m
//  Jccp
//
//  Created by Gary on 14-2-17.
//  Copyright (c) 2014年 蒲晓涛. All rights reserved.
//

#import "UIViewController+Shake.h"

@implementation UIViewController (Shake)


/**
 *  该方法判断是否为模拟器  是因为测试为了CBIntrospect 调试UI布局而写的判断
 *
 *  YES 摇一摇就可以使用  UI调试就不能使用
 *
 *  NO  摇一摇就不可以使用  UI调试可以使用
 *
 *  不要担心真机下不能使用摇一摇,该方法你不用去管
 *  @return BOOL
 */
- (BOOL)canBecomeFirstResponder
{
    
#if (TARGET_IPHONE_SIMULATOR)
        return NO;
#else
        return YES;
#endif
    
}

@end