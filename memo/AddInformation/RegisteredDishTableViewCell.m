//
//  RegisteredDishTableViewCell.m
//  memo
//
//  Created by ezura on 7/12/15.
//  Copyright (c) 2015 ezura. All rights reserved.
//

#import "RegisteredDishTableViewCell.h"
#import "BasicColor.h"

@interface RegisteredDishTableViewCell()

@property (weak, nonatomic) IBOutlet UIView *colorView;
@property (weak, nonatomic) IBOutlet UIImageView *dishImageView;

@end

@implementation RegisteredDishTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.backgroundColor = [UIColor clearColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - set contents
- (void)setContent:(Dish*)content
{
    self.colorView.backgroundColor = [BasicColor near:content.color].toUIColor;
    self.dishImageView.image = content.image;
}

@end
