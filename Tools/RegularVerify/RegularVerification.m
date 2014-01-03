//
//  RegularVerification.m
//  Jccp
//
//  Created by Gary on 14-1-3.
//  Copyright (c) 2014年 蒲晓涛. All rights reserved.
//

#import "RegularVerification.h"

@implementation RegularVerification

//账号检查
+ (BOOL)validateAccountWithString:(NSString*)strAccount
{
    NSString *accountRegex = @"^[\u4e00-\u9fa5-a-zA-Z0-9][\u4e00-\u9fa5-a-zA-Z0-9_]{3,11}$";
    NSPredicate *accountTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", accountRegex];
    return [accountTest evaluateWithObject:strAccount];
}

//账号检查是否为纯数字
+ (BOOL)validateAccountIsNumberWithString:(NSString*)strAccount
{
    NSString *accountRegex = @"^[0-9]{3,11}$";
    NSPredicate *accountTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", accountRegex];
    return [accountTest evaluateWithObject:strAccount];
}
//密码检查
+ (BOOL)validatePasswordWithString:(NSString*)strPassword
{
    NSString *passwordRegex = @"^[a-zA-Z0-9][a-zA-Z0-9_]{5,11}$";
    NSPredicate *passwordTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", passwordRegex];
    return [passwordTest evaluateWithObject:strPassword];
}

//邮箱检查
+ (BOOL)validateEmailWithString:(NSString*)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}


//身份证检查
+ (BOOL)validateIDWithString:(NSString*)strID
{
    NSString *idRegex = @"\\d{15}|\\d{17}[0-9|X|x]";
    NSPredicate *idTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", idRegex];
    return [idTest evaluateWithObject:strID];
}

//手机号码检查
+ (BOOL)validateMobileWithString:(NSString*)strMobile
{
    NSString *mobileRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *mobilTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mobileRegex];
    return [mobilTest evaluateWithObject:strMobile];
}

// 车牌号验证 MODIFIED BY HELENSONG
+ (BOOL)isValidateCarNo
{
    NSString *carRegex = @"^[A-Za-z]{1}[A-Za-z_0-9]{5}$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    return [carTest evaluateWithObject:self];
}

// 网址验证
+ (BOOL)isValidateUrl
{
    NSString *urlRegex = @"^((http)|(https))+:[^\\s]+\\.[^\\s]*$";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",urlRegex];
    return [urlTest evaluateWithObject:self];
}

// 姓名检查
+ (BOOL)validateNameWithString:(NSString*)userName
{
    NSString *nameRegex = @"([\u4e00-\u9fa5]{2,6})|([a-zA-Z]{4,12})";
    NSPredicate *nameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", nameRegex];
    return [nameTest evaluateWithObject:userName];
}

//密保答案
+ (BOOL)validateAnswerWithString:(NSString*)answerName
{
    NSString *answerRegex = @"([\u4e00-\u9fa5]{2,100})|([a-zA-Z0-9]{2,100})";
    NSPredicate* answerTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", answerRegex];
    return [answerTest evaluateWithObject:answerName];
}

// 性别
+ (BOOL)validateSexWithString:(NSString*)sexName
{
    NSString *sexRegex = @"([\u4e00-\u9fa5])";
    NSPredicate* sexTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", sexRegex];
    return [sexTest evaluateWithObject:sexName];
}

//银行卡号
+ (BOOL)validateBankNumberWithString:(NSString*)bankNumber
{
    NSString *bankNumberRegex = @"\\d{16,19}";
    NSPredicate *bankNumberTest  = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", bankNumberRegex];
    return [bankNumberTest evaluateWithObject:bankNumber];
}

//提现金额
+ (BOOL)validateWithDrawAmountWithString:(NSString*)withDrawAmount
{
    NSString *withDrawAmountRegex = @"^[1-9]\\d*$";
    NSPredicate *withDrawAmountTest  = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", withDrawAmountRegex];
    return [withDrawAmountTest evaluateWithObject:withDrawAmount];
}

// 开户银行
+ (BOOL)validateBankNameWithString:(NSString*)openBank
{
    NSString *bankNameRegex = @"([\u4e00-\u9fa5]{2,100})|([a-zA-Z]{4,200})";
    NSPredicate *bankNameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", bankNameRegex];
    return [bankNameTest evaluateWithObject:openBank];
}

// 开户地区
+ (BOOL)validateBankRegionWithString:(NSString*)openAddress
{
    NSString *bankRegionRegex = @"([\u4e00-\u9fa5]{2,100})|([a-zA-Z]{4,200})";
    NSPredicate *bankRegionTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", bankRegionRegex];
    return [bankRegionTest evaluateWithObject:openAddress];
}

@end
