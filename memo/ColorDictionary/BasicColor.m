//
//  BasicColor.m
//  memo
//
//  Created by ezura on 8/5/15.
//  Copyright (c) 2015 ezura. All rights reserved.
//

#import "BasicColor.h"

@interface BasicColor()

@property(setter=setId:)   NSString* id;
@property(setter=setRgb:)  UIColor*  rgb;
@property(setter=setName:) NSString* name;

@end

@implementation BasicColor

+ (instancetype)redColor
{
    BasicColor *color = [BasicColor new];
    color.id          = @"1";
    color.rgb         = [UIColor redColor];
    color.name        = @"red";
    return color;
}

+ (instancetype)orangeColor
{
    BasicColor *color = [BasicColor new];
    color.id          = @"2";
    color.rgb         = [UIColor orangeColor];
    color.name        = @"orange";
    return color;
}

+ (instancetype)greenColor
{
    BasicColor *color = [BasicColor new];
    color.id          = @"3";
    color.rgb         = [UIColor greenColor];
    color.name        = @"green";
    return color;
}

+ (instancetype)yellowColor
{
    BasicColor *color = [BasicColor new];
    color.id          = @"4";
    color.rgb         = [UIColor yellowColor];
    color.name        = @"yellow";
    return color;
}

+ (instancetype)whiteColor
{
    BasicColor *color = [BasicColor new];
    color.id          = @"5";
    color.rgb         = [UIColor whiteColor];
    color.name        = @"white";
    return color;
}

@end
