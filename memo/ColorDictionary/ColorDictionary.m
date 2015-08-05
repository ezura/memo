//
//  ColorDictionary.m
//  memo
//
//  Created by ezura on 8/5/15.
//  Copyright (c) 2015 ezura. All rights reserved.
//

#import "ColorDictionary.h"

@implementation ColorDictionary

static NSArray *basicColors;

+ (BasicColor*)lookUp:(UIColor*)color
{
    return [ColorDictionary colorMaster][0];
}

+ (NSArray*)colorMaster
{

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        basicColors = @[[BasicColor redColor],
                        [BasicColor orangeColor],
                        [BasicColor greenColor],
                        [BasicColor yellowColor]];
    });
    return basicColors;
}

@end
