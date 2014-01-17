//
//  LogMacro.h
//  Jccp
//
//  Created by Gary on 13-12-31.
//  Copyright (c) 2013年 蒲晓涛. All rights reserved.
//

#ifndef Jccp_LogMacro_h
#define Jccp_LogMacro_h

// -------------------打印日志-------------------------

// DEBUG  模式下打印日志,当前行
#ifdef DEBUG

  #define GY_DLog(fmt, ...) NSLog((@"Method : %s \n Line: %d \n Content : " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

#else

  #define GY_DLog(...)

#endif

// DEBUG  模式下打印日志,当前行 并弹出一个警告
#ifdef DEBUG

  #define GY_ULog(fmt, ...) {UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%s\n [Line %d] ", __PRETTY_FUNCTION__, __LINE__] message:[NSString stringWithFormat:fmt, ##__VA_ARGS__]  delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil]; [alert show]; }

#else

  #define GY_Log(...)

#endif

#define ITTDEBUG
#define ITTLOGLEVEL_INFO    10
#define ITTLOGLEVEL_WARNING 3
#define ITTLOGLEVEL_ERROR   1

#ifndef ITTMAXLOGLEVEL

  #ifdef DEBUG
    #define ITTMAXLOGLEVEL  ITTLOGLEVEL_INFO
  #else
    #define ITTMAXLOGLEVEL  ITTLOGLEVEL_ERROR
  #endif
#endif

// The general purpose logger. This ignores logging levels.
#ifdef ITTDEBUG
  #define ITTDPRINT(xx, ...)    NSLog(@"%s(%d): " xx, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
  #define ITTDPRINT(xx, ...)    ((void)0)
#endif

// Prints the current method's name.
#define ITTDPRINTMETHODNAME() ITTDPRINT(@"%s", __PRETTY_FUNCTION__)

// Log-level based logging macros.
#if ITTLOGLEVEL_ERROR <= ITTMAXLOGLEVEL
  #define ITTDERROR(xx, ...)    ITTDPRINT(xx, ##__VA_ARGS__)
#else
  #define ITTDERROR(xx, ...)    ((void)0)
#endif

#if ITTLOGLEVEL_WARNING <= ITTMAXLOGLEVEL
  #define ITTDWARNING(xx, ...)  ITTDPRINT(xx, ##__VA_ARGS__)
#else
  #define ITTDWARNING(xx, ...)  ((void)0)
#endif

#if ITTLOGLEVEL_INFO <= ITTMAXLOGLEVEL
  #define ITTDINFO(xx, ...) ITTDPRINT(xx, ##__VA_ARGS__)
#else
  #define ITTDINFO(xx, ...) ((void)0)
#endif

#ifdef ITTDEBUG
  #define ITTDCONDITIONLOG(condition, xx, ...)  {if ((condition)) {                \
                                                     ITTDPRINT(xx, ##__VA_ARGS__); \
                                                 }                                 \
} ((void)0)
#else
  #define ITTDCONDITIONLOG(condition, xx, ...)  ((void)0)
#endif

#define ITTAssert(condition, ...)                                                       \
    do {                                                                                \
        if (!(condition)) {                                                             \
            [[NSAssertionHandler currentHandler]                                        \
            handleFailureInFunction:[NSString stringWithUTF8String:__PRETTY_FUNCTION__] \
            file        :[NSString stringWithUTF8String:__FILE__]                       \
            lineNumber  :__LINE__                                                       \
            description :__VA_ARGS__];                                                  \
        }                                                                               \
    } while (0)

#pragma mark -
#pragma mark ** Log macros **

// standard types
#define GY_LOG_BOOL(object)    (NSLog(@"" #object @" %@", (object ? @"YES" : @"NO")));
#define GY_LOG_CHAR(object)    (NSLog(@"" #object @" %c", object));
#define GY_LOG_INT32(object)   (NSLog(@"" #object @" %d", object));
#define GY_LOG_UINT32(object)  (NSLog(@"" #object @" %u", object));
#define GY_LOG_LONG(object)    (NSLog(@"" #object @" %ld", object));
#define GY_LOG_ULONG(object)   (NSLog(@"" #object @" %lu", object));
#define GY_LOG_INT64(object)   (NSLog(@"" #object @" %qi", object));
#define GY_LOG_UINT64(object)  (NSLog(@"" #object @" %qu", object));
#define GY_LOG_FLOAT(object)   (NSLog(@"" #object @" %f", object));
#define GY_LOG_DOUBLE(object)  (NSLog(@"" #object @" %lf", object));

// NSInteger and NSInteger are platform independant integer types
#if __LP64__ || (TARGET_OS_EMBEDDED && !TARGET_OS_IPHONE) || TARGET_OS_WIN32 || NS_BUILD_32_LIKE_64
  #define GY_LOG_INTEGER(object)   (NSLog(@"" #object @" %ld", object));
  #define GY_LOG_UINTEGER(object)  (NSLog(@"" #object @" %lu", object));
#else
  #define GY_LOG_INTEGER(object)   (NSLog(@"" #object @" %d", object));
  #define GY_LOG_UINTEGER(object)  (NSLog(@"" #object @" %u", object));
#endif

// Various Cocoa/Objective-C log macros
#define GY_LOG_OBJECT(object)          (NSLog(@"" #object @" %@ %@:%d", [object description], [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__));
#define GY_LOG_KIND_OF_CLASS(object)   (NSLog(@"[" #object @" class] %@", NSStringFromClass([object class])));
#define GY_LOG_METHOD          (NSLog(@"%@ %@:%d\n%@", NSStringFromSelector(_cmd), [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, self))
#define GY_LOG_END_METHOD      (NSLog(@"END %@", NSStringFromSelector(_cmd)))
#define GY_LOG_METHOD_NAME     (NSLog(@"%p %@ %@", self, NSStringFromClass([self class]), NSStringFromSelector(_cmd)))
#define GY_LOG_METHOD_THREAD   (NSLog(@"%@ %@ %@:%d\n%@", NSStringFromSelector(_cmd), [NSThread currentThread], [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, self))
#define GY_LOG_CLASS_METHOD    (NSLog(@"%@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd)))

// Profiling Macros
#define GY_START_TIME(tag) NSDate * startTime_ ## tag = [NSDate date]; NSLog(@"start           " #tag);
#define GY_CHECK_TIME(tag) NSLog(@"elapsed %0.5f " #tag, [[NSDate date] timeIntervalSinceDate:startTime_ ## tag]);

#pragma mark -打印 rect / size / point / range

// Various Cocoa struct log macros
// NSRange

#define GY_LOG_RANGE(range)    (NSLog(@"" #range @" loc:%u len:%u", range.location, range.length));

    // CGPoint
#define GY_LOG_POINT(point)    (NSLog(@"" #point @" x:%f y:%f", point.x, point.y));

    // CGSize
#define GY_LOG_SIZE(size)      (NSLog(@"" #size @" width:%f height:%f", size.width, size.height));

    // CGRect
#define GY_LOG_RECT(rect)      (NSLog(@"" #rect @" x:%f y:%f w:%f h:%f", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height));

    // CLLocationCoordinate2D
#define GY_LOG_COORD2D(coord)  (NSLog(@"" #coord @" lat,lon: %+.6f,%+.6f", coord.latitude, coord.longitude));



#endif