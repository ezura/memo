
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
        [colors addObject:[[BasicColor alloc] _initWithColor:color]];
    }
    return colors;
}

#pragma mark - return basic color
//+ (instancetype)near:(UIColor*)color
//{
//}

#pragma mark representative color
//+ (instancetype)redColor
//{
//    return [BasicColor allBasicColor][[UIColor redColor]];
//}
//
//+ (instancetype)orangeColor
//{
//    return [BasicColor allBasicColor][[UIColor orangeColor]];
//}
//
//+ (instancetype)greenColor
//{
//    return [BasicColor allBasicColor][[UIColor greenColor]];
//}
//
//+ (instancetype)yellowColor
//{
//    return [BasicColor allBasicColor][[UIColor yellowColor]];
//}
//
//+ (instancetype)whiteColor
//{
//    return [BasicColor allBasicColor][[UIColor whiteColor]];
//}
//
//+ (instancetype)blackColor
//{
//    return [BasicColor allBasicColor][[UIColor blackColor]];
//}

#pragma mark - compute
/**
 *  RGB 空間上での平方ユークリッド距離を返す
 *
 *  @param color 距離を計算する対象の色
 *
 *  @return 引数の色と自身の平方ユークリッド距離
 */
- (NSNumber*)_distance:(UIColor*)color
{
    CGFloat colorRgb[4];
    CGFloat selfRgb[4];
    UIColor* selfColor = self.rgb;
    
    if(! [color getRed:&colorRgb[0] green:&colorRgb[1] blue:&colorRgb[2] alpha:&colorRgb[3]] ||
       ! [selfColor getRed:&selfRgb[0] green:&selfRgb[1] blue:&selfRgb[2] alpha:&selfRgb[3]]) {
        return nil;
    }
    
    CGFloat distance = powf(colorRgb[0]-selfRgb[0], 2.f) +
                       powf(colorRgb[1]-selfRgb[1], 2.f) +
                       powf(colorRgb[2]-selfRgb[2], 2.f);
    return [NSNumber numberWithFloat:distance];
}

@end
