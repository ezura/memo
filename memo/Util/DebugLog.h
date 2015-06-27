//
//  DebugLog.h
//  memo
//
//  Created by ezura on 6/27/15.
//  Copyright (c) 2015 ezura. All rights reserved.
//

#ifndef memo_DebugLog_h
#define memo_DebugLog_h

#ifdef DEBUG
#define LOG(...) NSLog(__VA_ARGS__)
#define LOG_PRINTF(FORMAT, ...) printf("%s\n", [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#define LOG_METHOD NSLog(@"%s", __func__)
#define LOG_METHOD_AND_ABORT LOG_METHOD; abort()

#define LOG_PRINTF_C(FORMAT, ...) printf(FORMAT, ##__VA_ARGS__);

#else
#define LOG(...)
#define LOG_PRINTF(FORMAT, ...)
#define LOG_METHOD
#define LOG_METHOD_AND_ABORT
#define LOG_PRINTF_C(FORMAT, ...)
#endif

#ifdef DEBUG
#define LOG_POINT(p) NSLog(@"%f, %f", p.x, p.y)
#define LOG_SIZE(p) NSLog(@"%f, %f", p.width, p.height)
#define LOG_RECT(p) NSLog(@"%f, %f - %f, %f", p.origin.x, p.origin.y, p.size.width, p.size.height)
#else
#define LOG_POINT(p)
#define LOG_SIZE(p)
#define LOG_RECT(p)
#endif

#endif
