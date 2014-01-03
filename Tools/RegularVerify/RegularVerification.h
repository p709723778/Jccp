//
//  RegularVerification.h
//  Jccp
//
//  Created by Gary on 14-1-3.
//  Copyright (c) 2014年 蒲晓涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegularVerification : NSObject

//账号检查
+ (BOOL)validateAccountWithString:(NSString*)strAccount;

//账号检查是否为纯数字
+ (BOOL)validateAccountIsNumberWithString:(NSString*)strAccount;

//密码检查
+ (BOOL)validatePasswordWithString:(NSString*)strPassword;

//邮箱检查
+ (BOOL)validateEmailWithString:(NSString*)email;

//身份证检查
+ (BOOL)validateIDWithString:(NSString*)strID;

//手机号码检查
+ (BOOL)validateMobileWithString:(NSString*)strMobile;

// 车牌号验证 MODIFIED BY HELENSONG
+ (BOOL)isValidateCarNo;

// 网址验证
+ (BOOL)isValidateUrl;

// 姓名检查
+ (BOOL)validateNameWithString:(NSString*)userName;

//密保答案
+ (BOOL)validateAnswerWithString:(NSString*)answerName;

//性别
+ (BOOL)validateSexWithString:(NSString*)sexName;

//银行卡号
+ (BOOL)validateBankNumberWithString:(NSString*)bankNumber;

//提现金额
+ (BOOL)validateWithDrawAmountWithString:(NSString*)withDrawAmount;

// 开户银行
+ (BOOL)validateBankNameWithString:(NSString*)openBank;

// 开户地区
+ (BOOL)validateBankRegionWithString:(NSString*)openAddress;

@end
