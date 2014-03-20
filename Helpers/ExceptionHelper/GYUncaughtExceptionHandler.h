//
//  GYUncaughtExceptionHandler.h
//  Jccp
//
//  Created by Gary on 14-3-20.
//  Copyright (c) 2014年 蒲晓涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GYUncaughtExceptionHandler : NSObject
{
    BOOL dismissed;
}

void HandleException(NSException *exception);

void SignalHandler(int signal);

void InstallUncaughtExceptionHandler(void);

@end
