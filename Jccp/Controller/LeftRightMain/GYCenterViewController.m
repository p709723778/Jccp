//
//  GYCenterViewController.m
//  Jccp
//
//  Created by Gary on 14-4-8.
//  Copyright (c) 2014年 蒲晓涛. All rights reserved.
//

#import "GYCenterViewController.h"

#import "UIViewController+MMDrawerController.h"
#import "MMDrawerBarButtonItem.h"
#import "GYAdvertHeaderView.h"

@interface GYCenterViewController ()

@end

@implementation GYCenterViewController

- (id)init
{
    self = [super init];

    if (self) {
        [self setRestorationIdentifier:@"MMExampleCenterControllerRestorationKey"];
    }

    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    if (self) {
        // Custom initialization
    }

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.view setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    [self viewLayout];
    [self setNavigationController];
}

// 布局UI
- (void)viewLayout
{
    // 此属性是设置ScrollViewInsets不自动自动适配
    self.automaticallyAdjustsScrollViewInsets = NO;
    NSArray             *arrayImages = @[@"http://d.hiphotos.baidu.com/image/w%3D2048/sign=dd8707b63f6d55fbc5c67126591a4e4a/14ce36d3d539b600c1e364dfeb50352ac65cb7ad.jpg", @"http://e.hiphotos.baidu.com/image/w%3D2048/sign=93a0b6a0184c510faec4e51a5461242d/d1a20cf431adcbef62ed166eaeaf2edda2cc9ff8.jpg", @"http://c.hiphotos.baidu.com/image/w%3D2048/sign=dddb25930846f21fc9345953c21c6a60/cb8065380cd791239dccff1caf345982b2b780ad.jpg"];
    GYAdvertHeaderView  *advertHeaderView = [[GYAdvertHeaderView alloc] initWithFrame:CGRectMake(0, GY_NavBarHeight + GY_StateBarHeight, GY_MainWidth, 170 / 2)];
    [advertHeaderView configAdvert:arrayImages];
    advertHeaderView.clickImageHandler = ^(NSUInteger newIndex, NSUInteger clickIndex)
    {
        NSLog(@"%li   ================   %li",(long)newIndex, (long)clickIndex);
    };
    [self.view addSubview:advertHeaderView];
}

// 设置视图导航栏
- (void)setNavigationController
{
    // 导航栏 左边按钮
    UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 22, 22)];

    [leftButton setBackgroundImage:[UIImage imageNamed:@"CenterViewNavBarLeft"] forState:UIControlStateNormal];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"CenterViewNavBarLeft_Press"] forState:UIControlStateHighlighted];
    [leftButton addTarget:self action:@selector(leftDrawerButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    [self.navigationItem setLeftBarButtonItem:leftButtonItem animated:YES];

    // 导航栏 右边按钮
    UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 22, 22)];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"CenterViewNavBarRigth"] forState:UIControlStateNormal];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"CenterViewNavBarRigth_Press"] forState:UIControlStateHighlighted];
    [rightButton addTarget:self action:@selector(rightDrawerButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    [self.navigationItem setRightBarButtonItem:rightButtonItem animated:YES];

    // NavLogo 定义
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CenterViewNavBarLogo"]];
}

#pragma mark - Button Handlers
- (void)leftDrawerButtonPress:(id)sender
{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

- (void)rightDrawerButtonPress:(id)sender
{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end