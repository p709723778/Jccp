//
//  GYGameHallViewController.m
//  Jccp
//
//  Created by Gary on 14-3-20.
//  Copyright (c) 2014年 蒲晓涛. All rights reserved.
//

#import "GYGameHallViewController.h"

#import "UIViewController+MMDrawerController.h"
#import "MMDrawerBarButtonItem.h"

@interface GYGameHallViewController ()

@end

@implementation GYGameHallViewController

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
    self.title = @"购彩大厅";
    
    UITapGestureRecognizer * doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap:)];
    [doubleTap setNumberOfTapsRequired:2];
    [self.view addGestureRecognizer:doubleTap];
    
    UITapGestureRecognizer * twoFingerDoubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(twoFingerDoubleTap:)];
    [twoFingerDoubleTap setNumberOfTapsRequired:2];
    [twoFingerDoubleTap setNumberOfTouchesRequired:2];
    [self.view addGestureRecognizer:twoFingerDoubleTap];
    
    
    [self setupLeftMenuButton];
    [self setupRightMenuButton];
    
    [self.view setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
}


-(void)setupLeftMenuButton{
    
//    UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 22, 22)];
//    
//    [leftButton setBackgroundImage:[UIImage imageNamed:@"tab_icon1"] forState:UIControlStateNormal];
//    [leftButton setBackgroundImage:[UIImage imageNamed:@"tab_icon2"] forState:UIControlStateHighlighted];
//    [leftButton addTarget:self action:@selector(leftDrawerButtonPress:) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
//    [self.navigationItem setLeftBarButtonItem:leftButtonItem animated:YES];
    
    MMDrawerBarButtonItem * leftDrawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(leftDrawerButtonPress:)];
//    leftDrawerButton.image = nil;
    [leftDrawerButton setBackgroundImage:[UIImage imageNamed:@"tab_icon1"] forState:UIControlStateNormal barMetrics:(UIBarMetricsDefault)];
    [leftDrawerButton setBackgroundImage:[UIImage imageNamed:@"tab_icon2"] forState:UIControlStateHighlighted barMetrics:(UIBarMetricsDefault)];
    
    [self.navigationItem setLeftBarButtonItem:leftDrawerButton animated:YES];
    
}

-(void)setupRightMenuButton{
//    UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 22, 22)];
//    
//    [rightButton setBackgroundImage:[UIImage imageNamed:@"tab_icon3"] forState:UIControlStateNormal];
//    [rightButton setBackgroundImage:[UIImage imageNamed:@"tab_icon4"] forState:UIControlStateHighlighted];
//    [rightButton addTarget:self action:@selector(rightDrawerButtonPress:) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
//    [self.navigationItem setRightBarButtonItem:rightButtonItem animated:YES];
    
    MMDrawerBarButtonItem * rightDrawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(rightDrawerButtonPress:)];
    [rightDrawerButton setImage:nil];
    [rightDrawerButton setBackgroundImage:[UIImage imageNamed:@"tab_icon3"] forState:UIControlStateNormal barMetrics:(UIBarMetricsDefault)];
    [rightDrawerButton setBackgroundImage:[UIImage imageNamed:@"tab_icon4"] forState:UIControlStateHighlighted  barMetrics:(UIBarMetricsDefault)];
    [self.navigationItem setRightBarButtonItem:rightDrawerButton animated:YES];
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
