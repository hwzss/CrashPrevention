//
//  NSMutableArray+WZ_Crash.m
//  CrashPrevention
//
//  Created by qwkj on 2017/12/4.
//  Copyright © 2017年 qwkj. All rights reserved.
//

#import "NSMutableArray+WZ_Crash.h"
#import "CrashPreventionHeader.h"

@implementation NSMutableArray (WZ_Crash)
+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class aClass = objc_getClass("__NSArrayM");
        wz_simple_Swizzle(aClass, @selector(objectAtIndex:), @selector(WZ_Crash_NSArrayM_objectAtIndex:));
        wz_simple_Swizzle(aClass, @selector(insertObject:atIndex:), @selector(WZ_Crash_NSArrayM_insertObject:atIndex:));
    });
}

- (id)WZ_Crash_NSArrayM_objectAtIndex:(NSUInteger)index
{
    
    if (self.count <= index)
    {
        if (WZ_Crash_Should_Report)
        {
            @try
            {
                return [self WZ_Crash_NSArrayM_objectAtIndex:index];
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
        return [self WZ_Crash_NSArrayM_objectAtIndex:index];
    }
}
-(void)WZ_Crash_NSArrayM_insertObject:(id)anObject atIndex:(NSUInteger)index{
    if (!anObject) {
        if (WZ_Crash_Should_Report)
        {
            @try
            {
                [self WZ_Crash_NSArrayM_insertObject:anObject atIndex:index];
            }
            @catch (NSException *exception)
            {
                
                NSLog(@"---------- %s Crash Because Method %s  ----------\n", class_getName(self.class), __func__);
                NSLog(@"%@", [exception callStackSymbols]);

            }
            @finally
            {
            }
        }
    }else{
        [self WZ_Crash_NSArrayM_insertObject:anObject atIndex:index];
    }
}
@end
