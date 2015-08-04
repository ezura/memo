//
//  EnclosedAreaPicker.h
//  memo
//
//  Created by ezura on 7/15/15.
//  Copyright (c) 2015 ezura. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DrawLayerView.h"
#import "EnclosedAreaColorPickerResult.h"

@class EnclosedAreaColorPicker;

@protocol EnclosedAreaColorPickerDelegate <NSObject>

- (void)enclosedAreaColorPicker:(EnclosedAreaColorPicker*)enclosedAreaColorPicker result:(EnclosedAreaColorPickerResult*)result;

@end

@interface EnclosedAreaColorPicker : NSObject

@property (nonatomic, weak) id<EnclosedAreaColorPickerDelegate> delegate;

- (instancetype)initWithTargetView:(UIView*)pickTargetView;

@end
