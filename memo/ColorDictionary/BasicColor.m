
//
//  BasicColor.m
//  memo
//
//  Created by ezura on 8/5/15.
//  Copyright (c) 2015 ezura. All rights reserved.
//

#import "BasicColor.h"

@interface BasicColor()
- (instancetype)_initWithColor:(NSDictionary*)color;

@property(setter=setId:)   NSString* id;
@property(setter=setRgb:)  UIColor*  rgb;
@property(setter=setName:) NSString* name;

@end

@implementation BasicColor

+ (NSArray*)_Master
{
    // TODO: plist とかから読み込む
    return @[
                 @{
                     @"rgb": [UIColor redColor],
                     @"id": @1,
                     @"name": @"red",
                   },
                 @{
                     @"rgb": [UIColor orangeColor],
                     @"id": @2,
                     @"name": @"orange",
                   },
                 @{
                     @"rgb": [UIColor greenColor],
                     @"id": @3,
                     @"name": @"green",
                  },
                 @{
                     @"rgb": [UIColor yellowColor],
                     @"id": @4,
                     @"name": @"yellow",
                   },
                 @{
                     @"rgb": [UIColor whiteColor],
                     @"id": @5,
                     @"name": @"white",
                   },
                 @{
                     @"rgb": [UIColor blackColor],
                     @"id": @5,
                     @"name": @"black",
                   },
             ];
}

- (instancetype)_initWithColor:(NSDictionary*)color
{
    if (self = [super init]) {
        self.rgb = color[@"rgb"];
        self.id  = color[@"id"];
        self.name = color[@"name"];
    }
    return self;
}

+ (NSArray*)allBasicColor
{
    static NSMutableArray* colors;
    
    if (colors) {
        return colors;
    }

    colors = @{}.mutableCopy;
    for (NSDictionary* color in [BasicColor _Master]) {
        colors[color[@"rgb"]] = [[BasicColor alloc] _initWithColor:color];
    }
    return colors;
}

+ (instancetype)redColor
{
    return [BasicColor allBasicColor][[UIColor redColor]];
}

+ (instancetype)orangeColor
{
    return [BasicColor allBasicColor][[UIColor orangeColor]];
}

+ (instancetype)greenColor
{
    return [BasicColor allBasicColor][[UIColor greenColor]];
}

+ (instancetype)yellowColor
{
    return [BasicColor allBasicColor][[UIColor yellowColor]];
}

+ (instancetype)whiteColor
{
    return [BasicColor allBasicColor][[UIColor whiteColor]];
}

@end
