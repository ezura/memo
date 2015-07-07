//
//  ColorAnalyzer.h
//  memo
//
//  Created by ezura on 7/2/15.
//  Copyright (c) 2015 ezura. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ColorAnalyzer : NSObject

void createMaskFromContour(const cv::Mat &contour, cv::Mat &output);
cv::Mat matWithImage(UIImage* image);

@end
