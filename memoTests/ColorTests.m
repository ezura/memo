//
//  ColorTests.m
//  memo
//
//  Created by ezura on 8/5/15.
//  Copyright (c) 2015 ezura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "BasicColor.h"

@interface BasicColor()

- (NSNumber*)_distance:(UIColor*)color;

@end

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

//- (void)testConsultRedColor
- (void)testSameObject
{
    BasicColor *color1 = [BasicColor redColor];
    BasicColor *color2 = [BasicColor redColor];
    
    id arrayTest = color1[1];
    id dicTest   = color1[@"1"];
    color1[1]   = @"1";
    color1[@1]  = @"2";
    
    
    XCTAssertEqual(color1, color2);
}

- (void)testCalcDistanceSameColor
{
    BasicColor *basicRedColor = [BasicColor redColor];
    UIColor *redColor         = [UIColor redColor];
    
    XCTAssertEqualObjects([basicRedColor _distance:redColor], [NSNumber numberWithFloat:0.f]);
}

/**
 *  近い色検索
 *  strawberry	229	0	49
 */
- (void)testGetNearStrawberryColor
{
    UIColor *color = [UIColor colorWithRed:229.f/255.f green:0.f blue:49.f/255.f alpha:1];
    XCTAssertEqualObjects([BasicColor near:color], [BasicColor redColor]);
}

/**
 *  近い色検索
 *  moss green	107	191	63
 */
- (void)testGetNearMossGreenColor
{
    UIColor *color = [UIColor colorWithRed:107.f/255.f green:191.f/255.f blue:63.f/255.f alpha:1];
    XCTAssertEqualObjects([BasicColor near:color], [BasicColor greenColor]);
}

@end
