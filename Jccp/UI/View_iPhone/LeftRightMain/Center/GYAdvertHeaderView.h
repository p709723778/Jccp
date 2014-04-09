//
//  GYAdvertHeaderView.h
//  Jccp
//
//  Created by Gary on 14-4-9.
//  Copyright (c) 2014年 蒲晓涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SMPageControl;

@interface GYAdvertHeaderView : UIView <UIScrollViewDelegate>
{
    int     TimeNum;
    BOOL    Tend;
    NSArray *imageArray;
    NSTimer *_timer;
}

@property (nonatomic, strong) UIScrollView  *sv;
@property (nonatomic, strong) SMPageControl *PageControl;
@property (nonatomic, strong) void          (^clickImageHandler)(NSUInteger newIndex,NSUInteger clickIndex);
// 设置广告栏图片
- (void)configAdvert:(NSArray *)imgArray;

@end