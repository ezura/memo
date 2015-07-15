//
//  AddInformationViewController.m
//  memo
//
//  Created by ezura on 6/27/15.
//  Copyright (c) 2015 ezura. All rights reserved.
//

#import "AddInformationViewController.h"
#import "ImageAnalyzer+Contour.h"
#import "ImageAnalyzer+Color.h"
#import "DishItem.h"
#import "RegisteredDishTableViewController.h"

@interface AddInformationViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *lunchBoxImageView;
@property (weak, nonatomic) IBOutlet DrawLayerView *drawLayerView;
@property (weak, nonatomic) RegisteredDishTableViewController *registeredDishTableViewController;

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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"RegisteredDishTable"]) {
        self.registeredDishTableViewController = (RegisteredDishTableViewController *)segue.destinationViewController;
        self.registeredDishTableViewController.dishes = self.dishItems;
    }
}

#pragma mark - DrawLayerView delegate
- (void)drawLayerView:(DrawLayerView*)drawLayerView drawnImage:(UIImage*)image
{
    // TODO: 並列処理
    DishItem *dishItem = [[DishItem alloc] initWithLunchBox:imageFromView(self.lunchBoxImageView) contourImage:image];
//    [self.dishItems addObject:dishItem];
    [self.dishItems insertObject:dishItem atIndex:0];
    
    self.registeredDishTableViewController.dishes = self.dishItems;
    [self.registeredDishTableViewController.tableView reloadData];
    [drawLayerView clearImage];
}

@end
