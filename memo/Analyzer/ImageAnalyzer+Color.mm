//
//  ImageAnalyzer+Color.m
//  memo
//
//  Created by ezura on 7/15/15.
//  Copyright (c) 2015 ezura. All rights reserved.
//

#import "ImageAnalyzer+Color.h"

using namespace std;
using namespace cv;

@implementation ImageAnalyzer (Color)

/**
 *  RGBの平均を計算
 *
 *  @param image 色を求める画像
 *
 *  @return 色の平均
 */
UIColor* computeColor(const cv::Mat &image)
{
    //    cv::Mat m1, m2;
    //
    //    cv::reduce(image, m1, 0, cv::REDUCE_AVG);
    //    cv::reduce(m1, m2, 1, cv::REDUCE_AVG);
    //
    //    return [UIColor colorWithRed:m2.data[0] green:m2.data[1] blue:m2.data[2] alpha:m2.data[3]];
    cv::Mat onePixImage;
    resize(image, onePixImage, cv::Size(1, 1), 0, 0, INTER_AREA);
    auto rgba = onePixImage.at<cv::Vec4b>(0,0);
    
    return [UIColor colorWithRed:rgba[0]/255.f green:rgba[1]/255.f blue:rgba[2]/255.f alpha:rgba[3]];
}

@end
