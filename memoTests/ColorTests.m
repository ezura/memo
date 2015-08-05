//
//  ColorTests.m
//  memo
//
//  Created by ezura on 8/5/15.
//  Copyright (c) 2015 ezura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "ColorDictionary.h"

@interface ColorTests : XCTestCase

@end

@implementation ColorTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testConsultRedColor
{
    BasicColor *color = [BasicColor redColor];
    BasicColor* lookUpColor = [ColorDictionary lookUp:[UIColor redColor]];
    
    XCTAssertEqualObjects(color.rgb, lookUpColor.rgb);
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
