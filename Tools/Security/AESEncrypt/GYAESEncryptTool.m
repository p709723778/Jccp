//
//  GYAESEncrypt.m
//  Jccp
//
//  Created by Gary on 14-4-15.
//  Copyright (c) 2014年 蒲晓涛. All rights reserved.
//

#import "GYAESEncryptTool.h"

@implementation GYAESEncryptTool

+ (NSData *)encryptAESData:(NSString *)string
{
    // 将nsstring转化为nsdata
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    // 使用密码对nsdata进行加密
    NSData *encryptedData = [data AES256EncryptWithKey:AES_Encrypt_Key];
    
    return encryptedData;
}

+ (NSString *)decryptAESData:(NSData *)data
{
    // 使用密码对data进行解密
    NSData *decryData = [data AES256DecryptWithKey:AES_Encrypt_Key];
    // 将解了密码的nsdata转化为nsstring
    NSString *string = [[NSString alloc] initWithData:decryData encoding:NSUTF8StringEncoding];
    
    return string;
}

@end
