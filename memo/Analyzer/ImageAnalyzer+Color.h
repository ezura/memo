//
//  ImageAnalyzer+Color.h
//  memo
//
//  Created by ezura on 7/15/15.
//  Copyright (c) 2015 ezura. All rights reserved.
//

#import "ImageAnalyzer.h"

@interface ImageAnalyzer (Color)

UIColor* computeColor(const cv::Mat &image);

@end
