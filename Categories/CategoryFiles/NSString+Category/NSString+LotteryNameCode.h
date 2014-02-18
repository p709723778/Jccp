//
//  NSString+LotteryNameCode.h
//  Jccp
//
//  Created by Gary on 14-2-18.
//  Copyright (c) 2014年 蒲晓涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LotteryNameCode)

//通过彩种代码获取彩种名称
- (id)lotteryName;

//通过彩种名称获取彩种代码
- (id)lotteryCode;

@end
