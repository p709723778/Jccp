//
//  MoreInterfaceViewController.m
//  Jccp
//
//  Created by Gary on 14-3-6.
//  Copyright (c) 2014年 蒲晓涛. All rights reserved.
//

#import "MoreInterfaceViewController.h"

@interface MoreInterfaceViewController () <UITableViewDataSource, UITableViewDelegate>
{
    UITableView *aTableView;
    NSArray     *dataSourceArray;
}
@end

@implementation MoreInterfaceViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    if (self) {
        // Custom initialization
    }

    return self;
}

- (void)dealloc
{
    aTableView = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"更多";

    dataSourceArray = GY_FileArray(@"MoreInterfaceTableItem", @"plist");
    NSLog(@"%@", dataSourceArray); // 直接打印数据。

    aTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, GY_MainWidth, GY_MainHeight) style:UITableViewStyleGrouped];
    aTableView.delegate = self;
    aTableView.dataSource = self;
    [self.view addSubview:aTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 分组个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [dataSourceArray count];
}

// 每组item个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary *dic = dataSourceArray[section];

    return [dic[@"itemContent"] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"测试";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, GY_MainWidth, 50)];
    NSDictionary    *dic = dataSourceArray[indexPath.section][@"itemContent"][indexPath.row];

    cell.textLabel.text = dic[@"itemContent"];

    if ([dic[@"itemType"] isEqualToString:@"intoNext"]) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else {
        cell.accessoryType = UITableViewCellEditingStyleNone;
    }

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"select");
}

@end