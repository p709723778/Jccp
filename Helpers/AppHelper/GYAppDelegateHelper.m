//
//  GYAppDelegateHelper.m
//  Jccp
//
//  Created by Gary on 14-3-20.
//  Copyright (c) 2014年 蒲晓涛. All rights reserved.
//

#import "GYAppDelegateHelper.h"

#import "GYAppTabBarController.h"
#import "GYAppTabBarItem.h"

#import "GYGameHallViewController.h"
#import "GYUserInterfaceViewController.h"
#import "GYOpenPrizeInfoViewController.h"
#import "GYNewsInfoViewController.h"
#import "GYMoreInterfaceViewController.h"

#import "MMDrawerController.h"

@implementation GYAppDelegateHelper

GY_SINGLETON_FOR_CLASS(GYAppDelegateHelper);

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

+ (MMDrawerController *)loadMMDrawerController
{
    UIViewController *leftSideDrawerViewController = [[GYUserInterfaceViewController alloc] init];

    UIViewController *centerViewController = [[GYGameHallViewController alloc] init];

    UIViewController *rightSideDrawerViewController = [[GYOpenPrizeInfoViewController alloc] init];

    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:centerViewController];

    [navigationController setRestorationIdentifier:@"MMExampleCenterNavigationControllerRestorationKey"];

    [rightSideDrawerViewController setRestorationIdentifier:@"MMExampleLeftNavigationControllerRestorationKey"];

    [leftSideDrawerViewController setRestorationIdentifier:@"MMExampleLeftNavigationControllerRestorationKey"];
    MMDrawerController *mmDrawerController = [[MMDrawerController alloc]
        initWithCenterViewController:navigationController
        leftDrawerViewController    :leftSideDrawerViewController
        rightDrawerViewController   :rightSideDrawerViewController];
    [mmDrawerController setShowsShadow:NO];
    [mmDrawerController setRestorationIdentifier:@"MMDrawer"];
    [mmDrawerController setMaximumRightDrawerWidth:280.0];
    [mmDrawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [mmDrawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];

//    [mmDrawerController
//    setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
//        MMDrawerControllerDrawerVisualStateBlock block;
//
//        if (block) {
//            block(drawerController, drawerSide, percentVisible);
//        }
//    }];

    return mmDrawerController;
}

+ (GYAppTabBarController *)loadTabBarController
{
    // TabBarController管理控制器
    GYAppTabBarController *appTabBarController = [[GYAppTabBarController alloc] init];

    // 彩票大厅
    GYGameHallViewController    *gameViewController = [[GYGameHallViewController alloc] init];
    GYAppTabBarItem             *theItemGameView = [[GYAppTabBarItem alloc] initWithTitle:@"购彩大厅" image:[UIImage imageNamed:@"tab_icon1"] tag:0];

    theItemGameView.selectedImage = [[UIImage imageNamed:@"tab_icon1_Press"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *navGameView = [[UINavigationController alloc] initWithRootViewController:gameViewController];
    [gameViewController setTabBarItem:theItemGameView];

    // 我的彩票
    GYUserInterfaceViewController   *viewControllerUserInterface = [[GYUserInterfaceViewController alloc] init];
    GYAppTabBarItem                 *theItemUserInterface = [[GYAppTabBarItem alloc] initWithTitle:@"我的彩票" image:[UIImage imageNamed:@"tab_icon2"] tag:0];
    theItemUserInterface.selectedImage = [[UIImage imageNamed:@"tab_icon2_Press"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *navUserInterface = [[UINavigationController alloc] initWithRootViewController:viewControllerUserInterface];

    [viewControllerUserInterface setTabBarItem:theItemUserInterface];

    // 开奖信息
    GYOpenPrizeInfoViewController   *viewControllerOpenPrizeInfo = [[GYOpenPrizeInfoViewController alloc] init];
    GYAppTabBarItem                 *theItemOpenPrizeInfo = [[GYAppTabBarItem alloc] initWithTitle:@"开奖信息" image:[UIImage imageNamed:@"tab_icon3"] tag:0];
    theItemOpenPrizeInfo.selectedImage = [[UIImage imageNamed:@"tab_icon3_Press"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *navOpenPrizeInfo = [[UINavigationController alloc] initWithRootViewController:viewControllerOpenPrizeInfo];

    [viewControllerOpenPrizeInfo setTabBarItem:theItemOpenPrizeInfo];

    // 新闻资讯
    GYNewsInfoViewController    *viewControllerNewsInfo = [[GYNewsInfoViewController alloc] init];
    GYAppTabBarItem             *theItemNewsInfo = [[GYAppTabBarItem alloc] initWithTitle:@"新闻资讯" image:[UIImage imageNamed:@"tab_icon4"] tag:0];
    theItemNewsInfo.selectedImage = [[UIImage imageNamed:@"tab_icon4_Press"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *navNewsInfo = [[UINavigationController alloc] initWithRootViewController:viewControllerNewsInfo];

    [viewControllerNewsInfo setTabBarItem:theItemNewsInfo];

    // 更多
    GYMoreInterfaceViewController   *viewControllerMoreInterface = [[GYMoreInterfaceViewController alloc] init];
    GYAppTabBarItem                 *theItemMoreInterface = [[GYAppTabBarItem alloc] initWithTitle:@"更多" image:[UIImage imageNamed:@"tab_icon5"] tag:0];
    theItemMoreInterface.selectedImage = [[UIImage imageNamed:@"tab_icon5_Press"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *navMoreInterface = [[UINavigationController alloc] initWithRootViewController:viewControllerMoreInterface];
    [viewControllerMoreInterface setTabBarItem:theItemMoreInterface];

    NSArray *controllers = [[NSArray alloc] initWithObjects:
        navGameView, navUserInterface, navOpenPrizeInfo, navNewsInfo, navMoreInterface, nil];
    [appTabBarController setViewControllers:controllers];

    // 设置UITabBar选中背景颜色
    [[UITabBar appearance] setTintColor:[UIColor greenColor]];

    // 设置UITabBarItem 普通状态 字体 颜色
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:0.57f green:0.57f blue:0.57f alpha:1.00f], NSForegroundColorAttributeName, [UIFont boldSystemFontOfSize:10.0f], NSFontAttributeName, nil] forState:UIControlStateNormal];

    // 设置UITabBarItem 选中状态 字体 颜色
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:0.79f green:0.25f blue:0.28f alpha:1.00f], NSForegroundColorAttributeName, [UIFont boldSystemFontOfSize:10.0f], NSFontAttributeName, nil] forState:UIControlStateSelected];

    return appTabBarController;
}

+ (void)setNavigationBarStyle
{
    // 修改导航栏标题的字体
    // UITextAttributeFont – 字体key
    // UITextAttributeTextColor – 文字颜色key
    // UITextAttributeTextShadowColor – 文字阴影色key
    // UITextAttributeTextShadowOffset – 文字阴影偏移量key

    NSShadow *shadow = [[NSShadow alloc] init];

    shadow.shadowColor = [UIColor clearColor];
    shadow.shadowOffset = CGSizeMake(0, 0);
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
    [UIColor whiteColor], NSForegroundColorAttributeName,
    shadow, NSShadowAttributeName,
    [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:21.0], NSFontAttributeName, nil]];

    // 定制返回按钮的颜
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];

    // 返回按钮背景图
    // [[UINavigationBar appearance] setBackIndicatorImage:[UIImage imageNamed:@"back_btn.png"]];
    // [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"back_btn.png"]];

    // 修改状态栏的风格
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

    // 在导航栏中使用背景图片
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"NavBar64.png"] forBarMetrics:UIBarMetricsDefault];

    [[UINavigationBar appearance] setShadowImage:[UIColor conversionImageWithColor:[UIColor clearColor]]];
    // 设置导航栏的背景颜色
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.82f green:0.23f blue:0.28f alpha:1.00f]];
}

@end