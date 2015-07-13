//
//  DishData.h
//  memo
//
//  Created by ezura on 7/12/15.
//  Copyright (c) 2015 ezura. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DishData : NSObject
@property (nonatomic, strong) UIImage*  dishImage;
@property (nonatomic, strong) UIColor*  color;
@property (nonatomic, assign) CGRect    rect;
@property (nonatomic, strong) NSString* lunchBoxId;
@end
