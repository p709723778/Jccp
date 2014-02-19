//
//  AppDelegateHelper.m
//  Jccp
//
//  Created by Gary on 14-2-17.
//  Copyright (c) 2014年 蒲晓涛. All rights reserved.
//

#import "AppDelegateHelper.h"

#import "AppTabBarController.h"
#import "AppTabBarItem.h"

#import "ViewController.h"

@implementation AppDelegateHelper

GY_SINGLETON_FOR_CLASS(AppDelegateHelper);

- (id)init
{
    if (self = [super init]) {
        _isFirst = [self isFirstLaunch];
    }
    
    return self;
}

/**
 *	@brief	判断App是否第一次启动
 *  该方法仅供本类用
 *	@return	YES Or NO
 */
- (BOOL)isFirstLaunch
{
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"everLaunched"]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"everLaunched"];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
    } else {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"firstLaunch"];
    }
    
    return [[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"];
}

+ (void)appLaunchingWithAnimation:(UIWindow *)mainMindow
{
    CGFloat     animateHeight = 310;
    UIImageView *splashView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, GY_ScreenWidth, GY_ScreenHeight)];
    
    if ([UIDevice isPhoneRetina4]) {
        [splashView setImage:[UIImage imageNamed:@"Default-568h"]];
        animateHeight = 400;
    } else {
        [splashView setImage:[UIImage imageNamed:@"Default"]];
        animateHeight = 380;
    }
    
    [mainMindow addSubview:splashView];
    [mainMindow bringSubviewToFront:splashView];
    
    UIImageView *lightpoint = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icare_iphone_lightpoint"]];
    //    lightpoint.layer.shadowColor = [UIColor whiteColor].CGColor;
    
    UIImageView *lightline = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icare_iphone_lightline"]];
    
    [lightline setCenter:CGPointMake(160, animateHeight)];
    [lightline setFrame:CGRectMake(lightline.frame.origin.x, lightline.frame.origin.y, 0, 1)];
    
    [lightpoint setCenter:CGPointMake(180, animateHeight)];
    lightpoint.hidden = YES;
    [splashView addSubview:lightpoint];
    
    [splashView addSubview:lightline];
    [UIView animateWithDuration:0.6
                   delay       :0.0
                   options     :UIViewAnimationOptionAllowAnimatedContent
                   animations  :^{
                       //                         [lightpoint setCenter:CGPointMake(233, 310)];
                       [lightline setFrame:CGRectMake(lightline.frame.origin.x, lightline.frame.origin.y, 188, 1)];
                   }
     
                   completion  :^(BOOL finished) {
                       lightpoint.hidden = NO;
                       [UIView animateWithDuration:0.6
                                      delay       :0.0
                                      options     :UIViewAnimationOptionAllowAnimatedContent
                                      animations  :^{
                                          [lightpoint setCenter:CGPointMake(233, animateHeight)];
                                      }
                        
                                      completion  :^(BOOL finished) {
                                          [splashView removeFromSuperview];
                                      }
                        
                        ];
                   }
     
     ];
}

+ (AppTabBarController *)loadTabBarController
{
    AppTabBarController *appTabBarController = [[AppTabBarController alloc] init];
    
    ViewController *viewController = [[ViewController alloc] init];
    
    AppTabBarItem *theItemOne = [[AppTabBarItem alloc] initWithTitle:@"index" image:[UIImage imageNamed:@"tab_icon1"] tag:0];
//    theItemOne.selectedImage = [UIImage imageNamed:@"tab_icon1_Press"];
    
    UINavigationController *navOne = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    [viewController setTabBarItem:theItemOne];
    
    
    ViewController *viewController1 = [[ViewController alloc] init];
    
    AppTabBarItem *theItemOne1 = [[AppTabBarItem alloc] initWithTitle:@"index" image:[UIImage imageNamed:@"tab_icon1"] tag:0];
//    theItemOne1.selectedImage = [[UIImage imageNamed:@"tab_icon1_Press"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [[UITabBar appearance] setTintColor:[UIColor greenColor]];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], NSForegroundColorAttributeName, nil]forState:UIControlStateNormal];
    
    UINavigationController *navOne1 = [[UINavigationController alloc] initWithRootViewController:viewController1];
    
    [viewController1 setTabBarItem:theItemOne1];
    
    
    NSArray *controllers = [[NSArray alloc] initWithObjects:
                            navOne, navOne1, nil];
    
    [appTabBarController setViewControllers:controllers];
    
    return appTabBarController;
}

+ (void)setNavigationBarStyle
{
    
    //修改导航栏标题的字体
    //UITextAttributeFont – 字体key
    //UITextAttributeTextColor – 文字颜色key
    //UITextAttributeTextShadowColor – 文字阴影色key
    //UITextAttributeTextShadowOffset – 文字阴影偏移量key
    
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor clearColor];
    shadow.shadowOffset = CGSizeMake(0, 0);
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                          [UIColor whiteColor], NSForegroundColorAttributeName,
                                                          shadow, NSShadowAttributeName,
                                                          [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:21.0], NSFontAttributeName, nil]];
        
        //定制返回按钮的颜
        [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
        
        //返回按钮背景图
        //[[UINavigationBar appearance] setBackIndicatorImage:[UIImage imageNamed:@"back_btn.png"]];
        //[[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"back_btn.png"]];
        
        //修改状态栏的风格
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        
        //在导航栏中使用背景图片
        [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"NavBar64.png"] forBarMetrics:UIBarMetricsDefault];
        
        [[UINavigationBar appearance] setShadowImage:[UIColor conversionImageWithColor:[UIColor clearColor]]];
        //设置导航栏的背景颜色
        [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.82f green:0.23f blue:0.28f alpha:1.00f]];
    
}

@end
