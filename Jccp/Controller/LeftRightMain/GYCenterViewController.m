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
    [self.view setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    [self viewLayout];
    [self addGesture];
    [self setNavigationController];
    
    
}


//布局UI
- (void)viewLayout
{
    //此属性是设置ScrollViewInsets不自动自动适配
    self.automaticallyAdjustsScrollViewInsets = NO;
    NSArray *arrayImages = @[@"http://e.hiphotos.baidu.com/image/w%3D2048/sign=ba2d41c7cc1b9d168ac79d61c7e6b58f/a71ea8d3fd1f41345be1d666271f95cad0c85ed0.jpg",@"http://b.hiphotos.baidu.com/image/w%3D2048/sign=205668f19e82d158bb825eb1b43218d8/c2fdfc039245d68825605cbba6c27d1ed21b244b.jpg",@"http://a.hiphotos.baidu.com/image/w%3D2048/sign=910aed6f544e9258a63481eea8bad058/4610b912c8fcc3ce5bd4cc389045d688d43f20a0.jpg"];
    GYAdvertHeaderView *advertHeaderView= [[GYAdvertHeaderView alloc] initWithFrame:CGRectMake(0, GY_NavBarHeight +GY_StateBarHeight, GY_MainWidth, 170 / 2)];
    [advertHeaderView configAdvert:arrayImages];
    [self.view addSubview:advertHeaderView];
    
}

//添加手势  (单个手指 和 两个手指 双击)
- (void)addGesture
{
    UITapGestureRecognizer * doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
    [doubleTap setNumberOfTapsRequired:2];
    [self.view addGestureRecognizer:doubleTap];
    
    UITapGestureRecognizer * twoFingerDoubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(twoFingerDoubleTap:)];
    [twoFingerDoubleTap setNumberOfTapsRequired:2];
    [twoFingerDoubleTap setNumberOfTouchesRequired:2];
    [self.view addGestureRecognizer:twoFingerDoubleTap];
}

//设置视图导航栏
- (void)setNavigationController{

    //导航栏 左边按钮
    UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 22, 22)];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"CenterViewNavBarLeft"] forState:UIControlStateNormal];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"CenterViewNavBarLeft_Press"] forState:UIControlStateHighlighted];
    [leftButton addTarget:self action:@selector(leftDrawerButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    [self.navigationItem setLeftBarButtonItem:leftButtonItem animated:YES];
    
    //导航栏 右边按钮
    UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 22, 30)];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"CenterViewNavBarRigth"] forState:UIControlStateNormal];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"CenterViewNavBarRigth_Press"] forState:UIControlStateHighlighted];
    [rightButton addTarget:self action:@selector(rightDrawerButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    [self.navigationItem setRightBarButtonItem:rightButtonItem animated:YES];
    
    //NavLogo 定义
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CenterViewNavBarLogo"]];
}


#pragma mark - Button Handlers
-(void)leftDrawerButtonPress:(id)sender{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

-(void)rightDrawerButtonPress:(id)sender{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}

-(void)doubleTap:(UITapGestureRecognizer*)gesture{
    [self.mm_drawerController bouncePreviewForDrawerSide:MMDrawerSideLeft completion:nil];
}

-(void)twoFingerDoubleTap:(UITapGestureRecognizer*)gesture{
    [self.mm_drawerController bouncePreviewForDrawerSide:MMDrawerSideRight completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
