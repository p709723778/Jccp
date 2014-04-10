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
//        self.userInteractionEnabled = YES;
        self.exclusiveTouch = NO;
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Action:)];
        singleTap.numberOfTapsRequired = 1;
        [self addGestureRecognizer:singleTap];
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

    _pageControl = [[SMPageControl alloc]initWithFrame:CGRectMake(10, _sv.frame.size.height - 20, GY_MainWidth - 10, 20)];
    _pageControl.alignment = SMPageControlAlignmentLeft;
    [_pageControl addTarget:self action:@selector(setPage) forControlEvents:UIControlEventValueChanged];
    [self addSubview:_pageControl];
}

- (void)AdImg:(NSArray *)arr
{
    [_sv setContentSize:CGSizeMake(GY_MainWidth *[arr count], self.frame.size.height)];

    imageArray = arr;
    _pageControl.numberOfPages = [imageArray count];

    for (int i = 0; i < [imageArray count]; i++) {
        NSString *url = [imageArray objectAtIndex:i];

        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(GY_MainWidth * i, 0, GY_MainWidth, self.frame.size.height)];
        // 这里进行图片缓存
        [img setImageWithURL:[NSURL URLWithString:url]
        placeholderImage    :[UIImage imageNamed:@"placeholder.png"]];
        [_sv addSubview:img];
    }
}

- (void)Action:(id)sender
{
    if (((UITapGestureRecognizer *)sender).numberOfTapsRequired == 1) {
        // 单指单击
        NSLog(@"单指单击");
        _clickImageHandler(_pageControl.currentPage, 1);
    }
}

#pragma mark - 5秒换图片
- (void)handleTimer:(NSTimer *)timer
{
    if (TimeNum % 5 == 0) {
        if (!Tend) {
            _pageControl.currentPage++;

            if (_pageControl.currentPage == _pageControl.numberOfPages - 1) {
                Tend = YES;
            }
        } else {
            _pageControl.currentPage--;

            if (_pageControl.currentPage == 0) {
                Tend = NO;
            }
        }

        [UIView animateWithDuration:0.8 // 速度0.7秒
                animations:^{           // 修改坐标
            _sv.contentOffset = CGPointMake(_pageControl.currentPage * GY_MainWidth, 0);
        }];
    }

    TimeNum++;
}

// UIPageControl 页数改变事件
- (void)setPage
{
    [UIView animateWithDuration:0.2 // 速度0.2秒
            animations:^{           // 修改坐标
        _sv.contentOffset = CGPointMake(_pageControl.currentPage * GY_MainWidth, 0);
    }];
}

#pragma mark - scrollView && page
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _pageControl.currentPage = scrollView.contentOffset.x / GY_MainWidth;
    //    NSLog(@"%li",_pageControl.currentPage);
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    // 开始拖动scrollview的时候 停止计时器控制的跳转
    [_timer setFireDate:[NSDate distantFuture]];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // 结束拖动scrollview的时候 启动计时器控制的跳转
    [_timer setFireDate:[NSDate distantPast]];
}

@end