//
//  RegisteredDishTableViewCell.m
//  memo
//
//  Created by ezura on 7/12/15.
//  Copyright (c) 2015 ezura. All rights reserved.
//

#import "RegisteredDishTableViewCell.h"

@interface RegisteredDishTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *colorImageView;
@property (weak, nonatomic) IBOutlet UIImageView *dishImageView;

@end

@implementation RegisteredDishTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - set contents
- (void)setContent:(DishItem*)content
{
    self.colorImageView.backgroundColor = content.data.color;
    self.dishImageView.image = content.data.dishImage;
}

@end
