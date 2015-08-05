//
//  BasicColor.h
//  memo
//
//  Created by ezura on 8/5/15.
//  Copyright (c) 2015 ezura. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BasicColor : NSObject

@property(nonatomic, readonly) NSString* id;
@property(nonatomic, readonly) UIColor*  rgb;
@property(nonatomic, readonly) NSString* name;

+ (instancetype)redColor;
+ (instancetype)orangeColor;
+ (instancetype)greenColor;
+ (instancetype)yellowColor;

@end
