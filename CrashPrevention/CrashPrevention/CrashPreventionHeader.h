
//
//  CrashPreventionHeader.h
//
//
//  Created by qwkj on 2017/12/4.
//  Copyright © 2017年 qwkj. All rights reserved.
//

#ifndef CrashPreventionHeader_h
#define CrashPreventionHeader_h

#import <objc/runtime.h>

#ifdef __OPTIMIZE__
#define WZ_Crash_Should_Report NO
#else
#define WZ_Crash_Should_Report NO
#endif

static inline BOOL wz_simple_Swizzle(Class aClass, SEL originalSel, SEL swizzleSel)
{
    Method originalMethod = class_getInstanceMethod(aClass, originalSel);
    Method swizzleMethod = class_getInstanceMethod(aClass, swizzleSel);
    method_exchangeImplementations(originalMethod, swizzleMethod);

    return YES;
}

#endif /* CrashPreventionHeader_h */
