//
//  SingletonMacro.h
//  Jccp
//
//  Created by Gary on 13-12-30.
//  Copyright (c) 2013年 蒲晓涛. All rights reserved.
//

#ifndef Jccp_SingletonMacro_h
#define Jccp_SingletonMacro_h

/**
 *  该头文件是定义 ARC / Non-ARC 下的单例模式模板
 *
 *  @param objc_arc 是否支持ARC
 *
 *  @return 静态实例
 */

#if __has_feature(objc_arc)

  #define DEFINE_SINGLETON_FOR_HEADER(className) \
                                                 \
    + (className *)shared##className;

  #define DEFINE_SINGLETON_FOR_CLASS(className)           \
                                                          \
    + (className *)shared##className {                    \
        static className        *shared##className = nil; \
        static dispatch_once_t  onceToken;                \
        dispatch_once(&onceToken, ^{                      \
                shared##className = [[self alloc] init];  \
            });                                           \
        return shared##className;                         \
    }

#else

  #define DEFINE_SINGLETON_FOR_HEADER(className) \
                                                 \
    + (className *)shared##className;

  #define DEFINE_SINGLETON_FOR_CLASS(classname)                 \
                                                                \
    static classname * shared##classname = nil;                 \
                                                                \
    + (classname *)shared##classname                            \
    {                                                           \
        @synchronized(self) {                                   \
            if (shared##classname == nil) {                     \
                shared##classname = [[self alloc] init];        \
            }                                                   \
        }                                                       \
                                                                \
        return shared##classname;                               \
    }                                                           \
                                                                \
    + (id)allocWithZone:(NSZone *)zone                          \
    {                                                           \
        @synchronized(self) {                                   \
            if (shared##classname == nil) {                     \
                shared##classname = [super allocWithZone:zone]; \
                return shared##classname;                       \
            }                                                   \
        }                                                       \
                                                                \
        return nil;                                             \
    }                                                           \
                                                                \
    - (id)copyWithZone:(NSZone *)zone                           \
    {                                                           \
        return self;                                            \
    }                                                           \
                                                                \
    - (id)retain                                                \
    {                                                           \
        return self;                                            \
    }                                                           \
                                                                \
    - (NSUInteger)retainCount                                   \
    {                                                           \
        return UINT_MAX;                                        \
    }                                                           \
                                                                \
    - (oneway void)release                                      \
    {                                                           \
    }                                                           \
                                                                \
    - (id)autorelease                                           \
    {                                                           \
        return self;                                            \
    }
#endif /* if __has_feature(objc_arc) */
#endif /* ifndef Jccp_SingletonMacro_h */