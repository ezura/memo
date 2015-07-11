//
//  DishItem.m
//  memo
//
//  Created by ezura on 7/12/15.
//  Copyright (c) 2015 ezura. All rights reserved.
//

#import "DishItem.h"
#import <opencv2/imgcodecs/ios.h>
#import "ImageAnalyzer+ContourAnalyze.h"

@interface DishItem()
@end

@implementation DishItem

- (id)initWithLunchBox:(UIImage*)lunchBox contourImage:(UIImage*)contourImage
{
    self = [self init];
    if (self) {
        [self createDishDataWithLunchBox:lunchBox contourImage:contourImage];
    }
    return self;
}

- (void)createDishDataWithLunchBox:(UIImage*)lunchBoxImage contourImage:(UIImage*)contourImage
{
    cv::Rect contourRect = computeContourRange(matWithImage(contourImage));
    cv::Mat lunchBoxCvMat = matWithImage(lunchBoxImage);
    
    self.data = [DishData new];
    self.data.dishImage = MatToUIImage(lunchBoxCvMat(contourRect).clone());
    
    self.data.rect = CGRectMake(contourRect.x, contourRect.y, contourRect.width, contourRect.height);
}

@end
