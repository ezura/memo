//
//  ImageAnalyzer+ColorAnalyze.m
//  memo
//
//  Created by ezura on 7/11/15.
//  Copyright (c) 2015 ezura. All rights reserved.
//

#import "ImageAnalyzer+Contour.h"

using namespace std;
using namespace cv;

@implementation ImageAnalyzer (Contour)

/**
 *  輪郭を抽出する
 *
 *  @param contourImage 図形を書いた image
 *  @param contours     解析した輪郭を格納場所
 *  @param hierarchy    conter に格納されている情報の構造情報を格納場所
 *  @param error        エラー発生情報の格納場所
 */
void computeContour(const cv::Mat &contourImage, vector<vector<cv::Point>> &contours, vector<Vec4i> &hierarchy, ImageAnalyzeError *error = nullptr)
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
    
    // FIXME: 無理やり感がある。面積で推測する
    if (contours.size() < 2 /* 外側を含めて数える */) {
        LOG_PRINTF_C("can't find contour");
        if (error != nullptr) {
            *error = ImageAnalyzeErrorUnusableResult;
        }
        return;
    }
    
    return;
}

/**
 *  図形を囲む最小の矩形を算出
 *
 *  @param contourImage 図形の描かれmた image
 *
 *  @return 図形を囲む最小の矩形
 */
cv::Rect computeContourRange(UIImage* contourImage)
{
    return computeContourRange(matWithImage(contourImage));
}

/**
 *  図形を囲む最小の矩形を算出
 *
 *  @param contourImage 図形の描かれmた image
 *
 *  @return 図形を囲む最小の矩形
 */
cv::Rect computeContourRange(const cv::Mat &contourImage)
{
    vector<vector<cv::Point>> contours;
    vector<Vec4i> hierarchy;
    ImageAnalyzeError error = ImageAnalyzeErrorNone;
    computeContour(contourImage, contours, hierarchy, &error);
    
    if (error != ImageAnalyzeErrorNone) {
        return cv::Rect();
    }
    
    cv::Rect contourBoundingRect = boundingRect(contours[1]);
    return contourBoundingRect;
}

/**
 *  囲んだ部分を内部を塗りつぶした image (マスク) を作成
 *
 *  @param contourImage 図形の描かれた image
 *  @param output       囲んだ部分を内部を塗りつぶした image
 */
void createMaskFromContour(const cv::Mat &contourImage, cv::Mat &output)
{
    vector<vector<cv::Point> > contours;
    vector<Vec4i> hierarchy;
    ImageAnalyzeError error = ImageAnalyzeErrorNone;
    computeContour(contourImage, contours, hierarchy, &error);
    
    if (error != ImageAnalyzeErrorNone) {
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
    Mat dst = Mat::zeros(contourImage.rows, contourImage.cols, CV_8U);
    drawContours( dst, contours, 1, Scalar(255, 255, 255), FILLED, 8, hierarchy[1][0] );
    
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
