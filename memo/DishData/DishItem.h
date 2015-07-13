//
//  DishItem.h
//  memo
//
//  Created by ezura on 7/12/15.
//  Copyright (c) 2015 ezura. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DishData.h"

@interface DishItem : NSObject
@property (nonatomic, strong) DishData* data;
@property (nonatomic, strong) UIButton* button;

- (id)initWithLunchBox:(UIImage*)lunchBox contourImage:(UIImage*)contourImage;
@end
