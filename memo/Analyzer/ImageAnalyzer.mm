//
//  ImageAnalyzer.m
//  memo
//
//  Created by ezura on 7/11/15.
//  Copyright (c) 2015 ezura. All rights reserved.
//

#import "ImageAnalyzer.h"
#import <opencv2/imgcodecs/ios.h>

using namespace std;
using namespace cv;

@implementation ImageAnalyzer

cv::Mat matWithImage(UIImage* image)
{
    // 画像の回転を補正する（内蔵カメラで撮影した画像などでおかしな方向にならないようにする）
    UIImage* correctImage = image;
    UIGraphicsBeginImageContext(correctImage.size);
    [correctImage drawInRect:CGRectMake(0, 0, correctImage.size.width, correctImage.size.height)];
    correctImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // UIImage -> cv::Mat
    cv::Mat mat;
    
    UIImageToMat(correctImage, mat);
    return mat;
}

UIImage *imageFromView(UIView *view)
{
    CGRect rect = view.bounds;
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0f);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:context];
    UIImage *capturedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return capturedImage;
}

@end
