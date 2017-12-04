//
//  NSMutableArrayCrash_Test.m
//  CrashPrevention
//
//  Created by qwkj on 2017/12/4.
//  Copyright © 2017年 qwkj. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface NSMutableArrayCrash_Test : XCTestCase

@end

@implementation NSMutableArrayCrash_Test

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


- (void)testBeyound{
    NSMutableArray * arr = [NSMutableArray new];
    [arr addObject:@"1"];
    [arr objectAtIndex:2];
}
- (void)testInsertNilObject{
    NSMutableArray * arr = [NSMutableArray new];
    id obj;
    [arr addObject:obj];
}
- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
