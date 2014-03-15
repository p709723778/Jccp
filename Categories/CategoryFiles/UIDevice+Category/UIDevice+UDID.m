//
//  UIDevice+UDID.m
//  Jccp
//
//  Created by Gary on 14-3-15.
//  Copyright (c) 2014年 蒲晓涛. All rights reserved.
//

#import "UIDevice+UDID.h"
#import <AdSupport/AdSupport.h>

@implementation UIDevice (UDID)

+ (NSString *)deviceAdvertiserID
{
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR || TARGET_OS_MAC)
        NSUUID *advertiserUUID = [[ASIdentifierManager sharedManager] advertisingIdentifier];

        if (advertiserUUID) {
            return [advertiserUUID UUIDString];
        } else {
            return nil; // [UIDevice currentDevice].uniqueIdentifier;
        }

#else   // #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
        return nil;
#endif  // #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
}

// Vindor标示符
+ (NSString *)deviceIdentifierForVendor
{
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR || TARGET_OS_MAC)
        NSUUID *vendorUUID = [[UIDevice currentDevice] identifierForVendor];

        if (vendorUUID) {
            return [vendorUUID UUIDString];
        } else {
            return nil; // [UIDevice currentDevice].uniqueIdentifier;
        }

#else   // #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
        return nil;
#endif  // #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
}

// 获取CFUUID
+ (NSString *)deviceCFUUID
{
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR || TARGET_OS_MAC)
        CFUUIDRef   cfuuid = CFUUIDCreate(kCFAllocatorDefault);
        NSString    *cfuuidString = (NSString *)CFBridgingRelease(CFUUIDCreateString(kCFAllocatorDefault, cfuuid));

        if (cfuuidString) {
            return cfuuidString;
        } else {
            return nil; // [UIDevice currentDevice].uniqueIdentifier;
        }

#else   // #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
        return nil;
#endif  // #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
}

// 获取NSUUID
+ (NSString *)deviceNSUUID
{
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR || TARGET_OS_MAC)
        id uuid = [NSUUID UUID];

        if (uuid) {
            return [uuid UUIDString];
        } else {
            return nil; // [UIDevice currentDevice].uniqueIdentifier;
        }

#else   // #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
        return nil;
#endif  // #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
}

@end