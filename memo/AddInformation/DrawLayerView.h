//
//  DrawLayerView.h
//  memo
//
//  Created by ezura on 6/27/15.
//  Copyright (c) 2015 ezura. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DrawLayerView;

@protocol DrawLayerViewDelegate <NSObject>
/**
 *  一つの図形が書き終わったときによばれる
 *
 *  @param view  DrawLayerView 自身
 *  @param image 完成した図形
 */
- (void)drawLayerView:(DrawLayerView*)drawLayerView drawnImage:(UIImage*)image;

@end

@interface DrawLayerView : UIImageView

@property (nonatomic, assign) id<DrawLayerViewDelegate> delegate;

@end
