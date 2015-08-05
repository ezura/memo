//
//  DrawLayerView.m
//  memo
//
//  Created by ezura on 6/27/15.
//  Copyright (c) 2015 ezura. All rights reserved.
//

#import "DrawLayerView.h"

@implementation DrawLayerView
{
    UIBezierPath *bezierPath;
}

- (id)init {
    self = [super init];
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
    
    [self.delegate drawLayerView:self drawnImage:self.image];
}

+ (UIImage *)imageWithView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();
    
    return img;
}

- (void)drawLine:(UIBezierPath*)path
{
    UIGraphicsBeginImageContext(self.frame.size);
    [[UIColor whiteColor] setStroke];
    [path stroke];
    self.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}

- (void)clearImage
{
    self.image = nil;
}

@end
