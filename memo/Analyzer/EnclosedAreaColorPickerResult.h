//
//  EnclosedAreaColorPickerResult.h
//  memo
//
//  Created by ezura on 8/2/15.
//  Copyright (c) 2015 ezura. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EnclosedAreaColorPickerResult : NSObject

@property CGRect rectIncludedContour;
@property UIImage *clipedImage;
@property UIColor *color;

@end
