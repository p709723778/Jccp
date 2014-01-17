//
//  GCDMacro.h
//  Jccp
//
//  Created by Gary on 13-12-31.
//  Copyright (c) 2013年 蒲晓涛. All rights reserved.
//

#ifndef Jccp_GCDMacro_h
#define Jccp_GCDMacro_h

#pragma mark - G－C－D

#define GY_GCDBackground(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)

#define G_GCDMain(block)       dispatch_async(dispatch_get_main_queue(),block)

#endif
