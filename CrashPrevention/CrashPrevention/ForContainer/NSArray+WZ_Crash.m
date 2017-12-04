//
//  NSArray+WZ_Crash.m
//
//
//  Created by qwkj on 2017/12/4.
//  Copyright © 2017年 qwkj. All rights reserved.
//

#import "NSArray+WZ_Crash.h"
#import "CrashPreventionHeader.h"

@implementation NSArray (WZ_Crash)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        wz_simple_Swizzle(objc_getClass("__NSArrayI"), @selector(objectAtIndex:), @selector(WZ_Crash_NSArrayI_objectAtIndex:));
    });
}

- (id)WZ_Crash_NSArrayI_objectAtIndex:(NSUInteger)index
{

    if (self.count <= index)
    {
        if (WZ_Crash_Should_Report)
        {
            @try
            {
                return [self WZ_Crash_NSArrayI_objectAtIndex:index];
            }
            @catch (NSException *exception)
            {

                NSLog(@"---------- %s Crash Because Method %s  ----------\n", class_getName(self.class), __func__);
                NSLog(@"%@", [exception callStackSymbols]);
                return nil;
            }
            @finally
            {
            }
        }
        else
        {
            return nil;
        }
    }
    else
    {
        return [self WZ_Crash_NSArrayI_objectAtIndex:index];
    }
}

@end

