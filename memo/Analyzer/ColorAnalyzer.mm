//
//  ColorAnalyzer.m
//  memo
//
//  Created by ezura on 7/2/15.
//  Copyright (c) 2015 ezura. All rights reserved.
//

#import "ColorAnalyzer.h"
#import <opencv2/imgcodecs/ios.h>

using namespace std;
using namespace cv;

@implementation ColorAnalyzer

//UIImage *

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


void computeContour(const cv::Mat &contourImage, vector<vector<cv::Point>> &contours, vector<Vec4i> hierarchy)
{
    // 輪郭抽出可能な形式に変換
    cv::Mat analizableImage;
    {
        cv::Mat grayImage, binImage;
        cv::cvtColor(contourImage, grayImage, CV_BGRA2GRAY);
        cv::threshold(grayImage, binImage, 0, 255, cv::THRESH_BINARY|cv::THRESH_OTSU);
        analizableImage = binImage;
    }
    
    // 輪郭抽出
    cv::findContours(analizableImage,
                     contours,
                     hierarchy,
                     RETR_LIST,
                     CV_CHAIN_APPROX_NONE);
    
    if (contours.size() < 2 /* 外側を含めて数える */) {
        LOG_PRINTF_C("can't find contour");
        return;
    }
    
    return;
}

void computeContourRange(const cv::Mat &contourImage)
{
    vector<vector<cv::Point> > contours;
    vector<Vec4i> hierarchy;
    computeContour(contourImage, contours, hierarchy);
    
    
}

void createMaskFromContour(const cv::Mat &contour, cv::Mat &output)
{
    // 輪郭抽出可能な形式に変換
    cv::Mat analizableImage;
    {
        cv::Mat grayImage, binImage;
        cv::cvtColor(contour, grayImage, CV_BGRA2GRAY);
        cv::threshold(grayImage, binImage, 0, 255, cv::THRESH_BINARY|cv::THRESH_OTSU);
        analizableImage = binImage;
    }
    
    // 輪郭抽出
    vector<vector<cv::Point> > contours;
    vector<Vec4i> hierarchy;
    cv::findContours(analizableImage,
                     contours,
                     hierarchy,
                     RETR_LIST,
                     CV_CHAIN_APPROX_NONE);
    
    if (contours.size() < 2 /* 外側を含めて数える */) {
        LOG_PRINTF_C("can't find contour");
        return;
    }
    
    // 最も大きい輪郭を塗りつぶす
//    double maxArea = -1;
//    vector<cv::Point> *useContour = nullptr;
//    for (auto foundContour: contours) {
//        auto area = contourArea(foundContour);
//        if (area > maxArea) {
//            maxArea = area;
//            useContour = &foundContour;
//        }
//    }
//
//    Mat dst = Mat::zeros(contour.rows, contour.cols, CV_8U);
//    drawContours( dst, contours, 1, Scalar(255, 255, 255), FILLED, 8, hierarchy[1][0] );
//    
//    UIImage *timage = MatToUIImage(contour.clone());
//    cv::Mat maskImage = cv::Mat::zeros(contour.size(), CV_8UC3);
//    vector<vector<cv::Point>> vectorForContur{*useContour};
//    Scalar color = Scalar(255, 255, 255);
//    cv::drawContours(maskImage, contours, 0, color, cv::FILLED);
//
//    UIImage *image = MatToUIImage(UIImage *timage = MatToUIImage(contour.clone()););
//    
//    output = ~dst;
//    UIImage *sample = MatToUIImage(output);
}

@end
