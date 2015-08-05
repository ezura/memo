//
//  ColorDictionary.h
//  memo
//
//  Created by ezura on 8/5/15.
//  Copyright (c) 2015 ezura. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BasicColor.h"

@interface ColorDictionary : NSObject

+ (BasicColor*)lookUp:(UIColor*)color;

@end
