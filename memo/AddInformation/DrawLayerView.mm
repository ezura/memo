//
//  DrawLayerView.m
//  memo
//
//  Created by ezura on 6/27/15.
//  Copyright (c) 2015 ezura. All rights reserved.
//

#import "DrawLayerView.h"

#import "ColorAnalyzer.h"
#import <opencv2/imgcodecs/ios.h>

@implementation DrawLayerView
{
    UIBezierPath *bezierPath;
}

- (id)init {
    self = [super self];
    if (self) {
        self.userInteractionEnabled = YES;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint currentPoint = [[touches anyObject] locationInView:self];
    bezierPath = [UIBezierPath bezierPath];
    bezierPath.lineCapStyle = kCGLineCapRound;
    bezierPath.lineWidth = 4.0;
    [bezierPath moveToPoint:currentPoint];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (bezierPath == nil){
        return;
    }
    CGPoint currentPoint = [[touches anyObject] locationInView:self];

    [bezierPath addLineToPoint:currentPoint];
    
    [self drawLine:bezierPath];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (bezierPath == nil){
        return;
    }
    CGPoint currentPoint = [[touches anyObject] locationInView:self];
    [bezierPath addLineToPoint:currentPoint];
    [self drawLine:bezierPath];
    
    cv::Mat test;
//    UIImageToMat([UIImage imageNamed:@"sample.jpg"], test);
//
////    UIImageToMat(img, test, true);
////    UIImage *test1 = UIImageFromMat(test);
//    test = [DrawLayerView matWithImage:[UIImage imageNamed:@"sample.jpg"]];
    test = [DrawLayerView matWithImage:self.image];
    UIImage *image = self.image;
    UIImage *image1 = MatToUIImage(test);
    cv::Mat output;
    createMaskFromContour(test, output);
    
    cv::Mat dst = cv::Mat::zeros(output.rows, output.cols, CV_8UC4);
    
    UIImageView *originImage = [[UIImageView alloc] initWithFrame:self.frame];
    originImage.image = [UIImage imageNamed:@"sample.jpg"];
    cv::Mat originMatImage = [DrawLayerView matWithImage:[DrawLayerView imageWithView:originImage]];
    originMatImage.copyTo(dst, output);
    UIImage *image2 = MatToUIImage(dst);
}

+ (UIImage *) imageWithView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}

+ (cv::Mat)matWithImage:(UIImage*)image
{
    CGColorSpaceRef colorSpace = CGImageGetColorSpace(image.CGImage);
    CGFloat cols = image.size.width;
    CGFloat rows = image.size.height;
    
    cv::Mat cvMat(rows, cols, CV_8UC4); // 8 bits per component, 4 channels
    
    CGContextRef contextRef = CGBitmapContextCreate(cvMat.data,                 // Pointer to  data
                                                    cols,                       // Width of bitmap
                                                    rows,                       // Height of bitmap
                                                    8,                          // Bits per component
                                                    cvMat.step[0],              // Bytes per row
                                                    colorSpace,                 // Colorspace
                                                    kCGImageAlphaNoneSkipLast |
                                                    kCGBitmapByteOrderDefault); // Bitmap info flags
    
    CGContextDrawImage(contextRef, CGRectMake(0, 0, cols, rows), image.CGImage);
    CGContextRelease(contextRef);
    //    CGColorSpaceRelease(colorSpace);
//    cv::cvtColor(cvMat, cvMat, cv::COLOR_BGRA2BGR);
    
    return cvMat;
}

- (void)drawLine:(UIBezierPath*)path
{
    UIGraphicsBeginImageContext(self.frame.size);
    [[UIColor whiteColor] setStroke];
    [path stroke];
    self.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}

@end
