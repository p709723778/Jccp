//
//  GYMoreInterfaceViewController.m
//  Jccp
//
//  Created by Gary on 14-3-20.
//  Copyright (c) 2014年 蒲晓涛. All rights reserved.
//

#import "GYMoreInterfaceViewController.h"

@interface GYMoreInterfaceViewController () <UITableViewDataSource, UITableViewDelegate>
{
    UITableView *aTableView;
    NSArray     *dataSourceArray;
}

@end

@implementation GYMoreInterfaceViewController

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
    return @"";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //cell重用机制
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
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
