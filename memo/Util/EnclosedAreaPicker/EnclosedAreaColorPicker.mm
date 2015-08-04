//
//  EnclosedAreaPicker.m
//  memo
//
//  Created by ezura on 7/15/15.
//  Copyright (c) 2015 ezura. All rights reserved.
//

#import "EnclosedAreaColorPicker.h"

#import <opencv2/opencv.hpp>

#import "DrawLayerView.h"
#import "ImageAnalyzer+Contour.h"
#import "ImageAnalyzer+Color.h"

@interface EnclosedAreaColorPicker() <DrawLayerViewDelegate>

@property(nonatomic, weak)   UIView* pickTargetView;
@property(nonatomic, strong) DrawLayerView* drawView;

@end

@implementation EnclosedAreaColorPicker

- (instancetype)initWithTargetView:(UIView*)pickTargetView
{
    self = [self init];
    
    if (self) {
        self.pickTargetView = pickTargetView;
        self.drawView = [[DrawLayerView alloc] initWithFrame:pickTargetView.frame];
        [pickTargetView addSubview:self.drawView];
    }
    return self;
}

#pragma mark - manage view
- (void)clearLine
{
    [self.drawView clearImage];
}

#pragma mark - compute color, rect, image
- (void)pickColorInCloedArea:(UIImage*)contourImage
{
    cv::Rect cvRectIncludeContour = computeContourRange(contourImage);
    UIImage *clipedImage = clipImage(imageFromView(self.pickTargetView), cvRectIncludeContour);
    UIColor *color = computeColor(matWithImage(clipedImage));
    
    CGRect rectIncludeContour = CGRectMake(cvRectIncludeContour.x, cvRectIncludeContour.y, cvRectIncludeContour.width, cvRectIncludeContour.height);
    
    EnclosedAreaColorPickerResult *pickedResult = [EnclosedAreaColorPickerResult new];
    pickedResult.rectIncludedContour = rectIncludeContour;
    pickedResult.clipedImage = clipedImage;
    pickedResult.color = color;
    
    [self.delegate enclosedAreaColorPicker:self result:pickedResult];
}

#pragma mark - DrawLayerViewDelegate
- (void)drawLayerView:(DrawLayerView*)drawLayerView drawnImage:(UIImage*)closedAreaImage
{
    [self pickColorInCloedArea:closedAreaImage];
}


@end
