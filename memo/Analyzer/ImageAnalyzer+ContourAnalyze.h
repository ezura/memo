//
//  ImageAnalyzer+ColorAnalyze.h
//  memo
//
//  Created by ezura on 7/11/15.
//  Copyright (c) 2015 ezura. All rights reserved.
//

#import "ImageAnalyzer.h"

@interface ImageAnalyzer (ContourAnalyze)

cv::Rect computeContourRange(const cv::Mat &contourImage);
void createMaskFromContour(const cv::Mat &contour, cv::Mat &output);
UIColor* computeColor(const cv::Mat &image);

@end
