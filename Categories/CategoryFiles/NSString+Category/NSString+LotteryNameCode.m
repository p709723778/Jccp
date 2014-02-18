//
//  NSString+LotteryNameCode.m
//  Jccp
//
//  Created by Gary on 14-2-18.
//  Copyright (c) 2014年 蒲晓涛. All rights reserved.
//

#import "NSString+LotteryNameCode.h"

@implementation NSString (LotteryNameCode)

- (id)lotteryName
{
    NSString *gameName = nil;
    
    if ([self isEqualToString:FC_SSQ]) {
        gameName = @"双色球";
    } else if ([self isEqualToString:TC_CJDLT]) {
        gameName = @"大乐透";
    } else if ([self isEqualToString:FC_D3]) {
        gameName = @"3D福彩";
    } else if ([self isEqualToString:FC_QLC]) {
        gameName = @"七乐彩";
    } else if ([self isEqualToString:FC_CQSSC]) {
        gameName = @"老时时彩";
    } else if ([self isEqualToString:TC_JXTC002]) {
        gameName = @"排列三";
    } else if ([self isEqualToString:TC_JXTC003]) {
        gameName = @"排列五";
    } else if ([self isEqualToString:TC_JXTC004]) {
        gameName = @"七星彩";
    } else if ([self isEqualToString:TC_C11X5]) {
        gameName = @"11选5";
    } else if ([self isEqualToString:FC_JXSSC]) {
        gameName = @"新时时彩";
    } else if ([self isEqualToString:JC_SFC]) {
        gameName = @"胜负彩";
    } else if ([self isEqualToString:JC_RJC]) {
        gameName = @"任九场";
    } else if ([self isEqualToString:JC_JQC]) {
        gameName = @"进球数";
    } else if ([self isEqualToString:JC_BQC]) {
        gameName = @"半全场";
    } else if ([self isEqualToString:JC_BD]) {
        gameName = @"北京单场";
    } else if ([self isEqualToString:JC_JC]) {
        gameName = @"竞彩足球";
    } else if ([self isEqualToString:TC_ESEXW]) {
        gameName = @"22选5";
    } else if ([self isEqualToString:FC_SHSSL]) {
        gameName = @"时时乐";
    } else if ([self isEqualToString:TC_JLC]) {
        gameName = @"即乐彩";
    } else if ([self isEqualToString:FC_KLSF]) {
        gameName = @"快乐十分";
    } else if ([self isEqualToString:JC_JLDXF]) {
        gameName = @"竞彩篮球";
    } else {
        gameName = @"未知彩种";
    }
    
    return gameName;
}

- (id)lotteryCode
{
    NSString *gameCode = nil;
    
    if ([self isEqualToString:@"双色球"]) {
        gameCode = FC_SSQ;
    } else if ([self isEqualToString:@"大乐透"]) {
        gameCode = TC_CJDLT;
    } else if ([self isEqualToString:@"3D福彩"] || [self isEqualToString:@"福彩3D"]) {
        gameCode = FC_D3;
    } else if ([self isEqualToString:@"七乐彩"]) {
        gameCode = FC_QLC;
    } else if ([self isEqualToString:@"老时时彩"]) {
        gameCode = FC_CQSSC;
    } else if ([self isEqualToString:@"排列三"]) {
        gameCode = TC_JXTC002;
    } else if ([self isEqualToString:@"排列五"]) {
        gameCode = TC_JXTC003;
    } else if ([self isEqualToString:@"七星彩"]) {
        gameCode = TC_JXTC004;
    } else if ([self isEqualToString:@"11选5"]) {
        gameCode = TC_C11X5;
    } else if ([self isEqualToString:@"新时时彩"]) {
        gameCode = FC_JXSSC;
    } else if ([self isEqualToString:@"胜负彩"]) {
        gameCode = JC_SFC;
    } else if ([self isEqualToString:@"任九场"]) {
        gameCode = JC_RJC;
    } else if ([self isEqualToString:@"进球数"]) {
        gameCode = JC_JQC;
    } else if ([self isEqualToString:@"半全场"]) {
        gameCode = JC_BQC;
    } else if ([self isEqualToString:@"北京单场"]) {
        gameCode = JC_BD;
    } else if ([self isEqualToString:@"竞彩足球"]) {
        gameCode = JC_JC;
    } else if ([self isEqualToString:@"22选5"]) {
        gameCode = TC_ESEXW;
    } else if ([self isEqualToString:@"时时乐"]) {
        gameCode = FC_SHSSL;
    } else if ([self isEqualToString:@"即乐彩"]) {
        gameCode = TC_JLC;
    } else if ([self isEqualToString:@"快乐十分"]) {
        gameCode = FC_KLSF;
    } else if ([self isEqualToString:@"竞彩篮球"]) {
        gameCode = JC_JLDXF;
    } else {
        gameCode = @"未知彩码";
    }
    
    return gameCode;
}

@end
