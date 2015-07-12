//
//  AddInformationViewController.m
//  memo
//
//  Created by ezura on 6/27/15.
//  Copyright (c) 2015 ezura. All rights reserved.
//

#import "AddInformationViewController.h"
#import "ImageAnalyzer+ContourAnalyze.h"
#import "DishItem.h"

@interface AddInformationViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *lunchBoxImageView;
@property (weak, nonatomic) IBOutlet DrawLayerView *drawLayerView;

@property (nonatomic, strong) NSMutableArray *dishItems;

@end

@implementation AddInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initField];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

# pragma mark - init
- (void)initField
{
    self.dishItems = [NSMutableArray new];
    self.drawLayerView.delegate = self;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - DrawLayerView delegate
- (void)drawLayerView:(DrawLayerView*)drawLayerView drawnImage:(UIImage*)image
{
    // TODO: 並列処理
    DishItem *dishItem = [[DishItem alloc] initWithLunchBox:imageFromView(self.lunchBoxImageView) contourImage:image];
    [self.dishItems addObject:dishItem];
    
    [drawLayerView clearImage];
}

@end
