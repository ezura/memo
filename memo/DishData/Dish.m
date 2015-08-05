//
//  Dish.m
//  memo
//
//  Created by ezura on 7/17/15.
//  Copyright (c) 2015 ezura. All rights reserved.
//

#import "Dish.h"

@implementation Dish

+ (instancetype)dishWithEnclosedAreaColorPickerResult:(EnclosedAreaColorPickerResult*)colorPickerResult
{
    Dish *dish = [Dish new];
    dish.image = colorPickerResult.clipedImage;
    dish.color = colorPickerResult.color;
    dish.rect  = colorPickerResult.rectIncludedContour;
//    dish.lunchBoxId = nil;
    
    return dish;
}

@end
