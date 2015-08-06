//
//  ImageAnalyzer.h
//  memo
//
//  Created by ezura on 7/11/15.
//  Copyright (c) 2015 ezura. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <opencv2/opencv.hpp>

typedef enum : NSUInteger {
    ImageAnalyzeErrorNone,
    ImageAnalyzeErrorArgumentError,
    ImageAnalyzeErrorUnusableResult
} ImageAnalyzeError;

@interface ImageAnalyzer : NSObject

cv::Mat matWithImage(UIImage* image);
UIImage *imageFromView(UIView *view);

/**
 *  画像を切り抜き
 *
 *  @param image 切り抜く画像
 *  @param rect  切り抜く範囲
 *
 *  @return 切り抜いた画像
 */
UIImage *clipImage(UIImage *image, cv::Rect rect);

@end
