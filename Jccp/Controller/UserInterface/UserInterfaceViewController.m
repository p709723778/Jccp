//
//  UserInterfaceViewController.m
//  Jccp
//
//  Created by Gary on 14-3-6.
//  Copyright (c) 2014年 蒲晓涛. All rights reserved.
//

#import "UserInterfaceViewController.h"

@interface UserInterfaceViewController ()

@end

@implementation UserInterfaceViewController

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
    self.title = @"我的彩票";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
