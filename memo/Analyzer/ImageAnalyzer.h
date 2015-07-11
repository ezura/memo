//
//  ImageAnalyzer.h
//  memo
//
//  Created by ezura on 7/11/15.
//  Copyright (c) 2015 ezura. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    ImageAnalyzeErrorNone,
    ImageAnalyzeErrorArgumentError,
    ImageAnalyzeErrorUnusableResult
} ImageAnalyzeError;

@interface ImageAnalyzer : NSObject

cv::Mat matWithImage(UIImage* image);

@end
