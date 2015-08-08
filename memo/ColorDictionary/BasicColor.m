
//
//  BasicColor.m
//  memo
//
//  Created by ezura on 8/5/15.
//  Copyright (c) 2015 ezura. All rights reserved.
//

#import "BasicColor.h"

@interface BasicColor()
- (instancetype)_initWithMaster:(NSDictionary*)color;

@property(setter=setId:)   NSString* id;
@property(setter=setRgb:)  UIColor*  rgb;
@property(setter=setName:) NSString* name;

@end

@implementation BasicColor

+ (NSArray*)_Masters
{
    // TODO: plist とかから読み込む
    // TODO: rgb 表現方法変更
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

- (instancetype)_initWithMaster:(NSDictionary*)master
{
    if (self = [super init]) {
        self.rgb  = master[@"rgb"];
        self.id   = master[@"id"];
        self.name = master[@"name"];
    }
    return self;
}

+ (NSArray*)allBasicColor
{
    static NSMutableArray* colors;
    
    if (colors) {
        return colors;
    }

    colors = @[].mutableCopy;
    NSArray* masters = [BasicColor _Masters];
    for (NSDictionary* master in masters) {
        [colors addObject:[[BasicColor alloc] _initWithMaster:master]];
    }
    return colors;
}

- (UIColor*)toUIColor
{
    return self.rgb;
}

#pragma mark - return basic color
+ (instancetype)near:(UIColor*)color
{
    BasicColor *nearestColor = nil;
    NSNumber *minDistance = [NSNumber numberWithFloat:MAXFLOAT];
    for (BasicColor* basicColor in [BasicColor allBasicColor]) {
        NSNumber *distance = [basicColor _distance:color];
        if ([distance compare:minDistance] == NSOrderedAscending) {
            minDistance = distance;
            nearestColor = basicColor;
        }
    }
    return nearestColor;
}

#pragma mark representative color
+ (instancetype)redColor
{
    return [BasicColor _colorName:@"red"];
}

+ (instancetype)orangeColor
{
    return [BasicColor _colorName:@"orange"];
}

+ (instancetype)greenColor
{
    return [BasicColor _colorName:@"green"];
}

+ (instancetype)yellowColor
{
    return [BasicColor _colorName:@"yellow"];
}

+ (instancetype)whiteColor
{
    return [BasicColor _colorName:@"white"];
}

+ (instancetype)blackColor
{
    return [BasicColor _colorName:@"black"];
}

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
    UIColor* selfColor = [self toUIColor];
    
    if(! [color getRed:&colorRgb[0] green:&colorRgb[1] blue:&colorRgb[2] alpha:&colorRgb[3]] ||
       ! [selfColor getRed:&selfRgb[0] green:&selfRgb[1] blue:&selfRgb[2] alpha:&selfRgb[3]]) {
        return nil;
    }
    
    CGFloat distance = powf(colorRgb[0]-selfRgb[0], 2.f) +
                       powf(colorRgb[1]-selfRgb[1], 2.f) +
                       powf(colorRgb[2]-selfRgb[2], 2.f);
    return [NSNumber numberWithFloat:distance];
}


/**
 *  マスタ中にある色を名前から指定して取得する
 *
 *  @param colorName 色の名前
 *
 *  @return 引数の名前をもつ色
 */
+ (BasicColor*)_colorName:(NSString*)colorName
{
    return _.
    array([BasicColor allBasicColor])
    .find(^BOOL(BasicColor *color){
        return [color.name isEqual:colorName];
    });
}

@end
