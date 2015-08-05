//
//  Dish.h
//  memo
//
//  Created by ezura on 7/17/15.
//  Copyright (c) 2015 ezura. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "EnclosedAreaColorPicker.h"

@interface Dish : NSObject

@property (nonatomic, strong) UIImage*  image;
@property (nonatomic, strong) UIColor*  color;
@property (nonatomic, assign) CGRect    rect;
//@property (nonatomic, strong) NSString* lunchBoxId;

+ (instancetype)dishWithEnclosedAreaColorPickerResult:(EnclosedAreaColorPickerResult*)colorPickerResult;
@end
