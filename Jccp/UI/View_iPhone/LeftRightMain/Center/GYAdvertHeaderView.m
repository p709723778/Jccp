//
//  GYAdvertHeaderView.m
//  Jccp
//
//  Created by Gary on 14-4-9.
//  Copyright (c) 2014年 蒲晓涛. All rights reserved.
//

#import "GYAdvertHeaderView.h"

#import "SMPageControl.h"

@implementation GYAdvertHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if (self) {
        // Initialization code
        [self configUserInterface];
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(handleTimer:) userInfo:nil repeats:YES];
    }

    return self;
}

/*
 *   // Only override drawRect: if you perform custom drawing.
 *   // An empty implementation adversely affects performance during animation.
 *   - (void)drawRect:(CGRect)rect
 *   {
 *    // Drawing code
 *   }
 */

- (void)dealloc
{
    // 关闭定时器
    [_timer setFireDate:[NSDate distantFuture]];
    _timer = nil;
}

- (void)configAdvert:(NSMutableArray *)imgArray
{
    [self AdImg:imgArray];
    [_timer setFireDate:[NSDate distantPast]];
}

- (void)configUserInterface
{
    _sv = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, GY_MainWidth, self.frame.size.height)];
    _sv.delegate = self;
    _sv.showsHorizontalScrollIndicator = NO;
    _sv.showsVerticalScrollIndicator = NO;
    _sv.pagingEnabled = YES;
    [self addSubview:_sv];

    _PageControl = [[SMPageControl alloc]initWithFrame:CGRectMake(10, _sv.frame.size.height - 20, GY_MainWidth - 10, 20)];
    _PageControl.alignment = SMPageControlAlignmentLeft;
    [_PageControl addTarget:self action:@selector(setPage) forControlEvents:UIControlEventValueChanged];
    [self addSubview:_PageControl];
}

- (void)AdImg:(NSArray *)arr
{
    [_sv setContentSize:CGSizeMake(GY_MainWidth *[arr count], self.frame.size.height)];

    _PageControl.numberOfPages = [arr count];

    for (int i = 0; i < [arr count]; i++) {
        NSString *url = [arr objectAtIndex:i];

        UIButton *img = [[UIButton alloc]initWithFrame:CGRectMake(GY_MainWidth * i, 0, GY_MainWidth, self.frame.size.height)];

        // [img addTarget:self action:@selector(Action) forControlEvents:UIControlEventTouchUpInside];

        [_sv addSubview:img];

        // [img setImage:[UIImage imageNamed:@"jiazai_test@2x.png"] forState:UIControlStateNormal];

        UIImageFromURL([NSURL URLWithString:url], ^(UIImage *image)

            {
                [img setBackgroundImage:image forState:UIControlStateNormal];
            }, ^(void) {});
    }
}

- (void)Action:(id)sender
{
    //    UIButton *btn = (UIButton *)sender;
    //    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/?c=api_main&callType=JSON&a=getBanner", ServerAddress]];
}

void UIImageFromURL(NSURL *URL, void (^imageBlock)(UIImage *image), void (^errorBlock)(void))
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void)
        {
            NSData *data = [[NSData alloc] initWithContentsOfURL:URL];
            UIImage *image = [[UIImage alloc] initWithData:data];
            dispatch_async(dispatch_get_main_queue(), ^(void) {
                if (image != nil) {
                    imageBlock(image);
                } else {
                    errorBlock();
                }
            });
        });
}

#pragma mark - 5秒换图片
- (void)handleTimer:(NSTimer *)timer
{
    if (TimeNum % 5 == 0) {
        if (!Tend) {
            _PageControl.currentPage++;

            if (_PageControl.currentPage == _PageControl.numberOfPages - 1) {
                Tend = YES;
            }
        } else {
            _PageControl.currentPage--;

            if (_PageControl.currentPage == 0) {
                Tend = NO;
            }
        }

        [UIView animateWithDuration:0.8 // 速度0.7秒
                animations:^{           // 修改坐标
            _sv.contentOffset = CGPointMake(_PageControl.currentPage * GY_MainWidth, 0);
        }];
    }

    TimeNum++;
}

// UIPageControl 页数改变事件
- (void)setPage
{
    [UIView animateWithDuration:0.2 // 速度0.2秒
            animations:^{           // 修改坐标
        _sv.contentOffset = CGPointMake(_PageControl.currentPage * GY_MainWidth, 0);
    }];
}

#pragma mark - scrollView && page
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _PageControl.currentPage = scrollView.contentOffset.x / GY_MainWidth;
}


@end