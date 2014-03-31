//
//  GYOpenPrizeInfoViewController.m
//  Jccp
//
//  Created by Gary on 14-3-20.
//  Copyright (c) 2014年 蒲晓涛. All rights reserved.
//

#import "GYOpenPrizeInfoViewController.h"

@interface GYOpenPrizeInfoViewController ()

@end

@implementation GYOpenPrizeInfoViewController

-(id)init{
    self = [super init];
    if(self){
        [self setRestorationIdentifier:@"MMExampleRightSideDrawerController"];
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
    self.title = @"开奖信息";
    
    [self.view setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
