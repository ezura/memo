//
//  AddInformationViewController.m
//  memo
//
//  Created by ezura on 6/27/15.
//  Copyright (c) 2015 ezura. All rights reserved.
//

#import "AddInformationViewController.h"
#import "DishItem.h"
#import "RegisteredDishTableViewController.h"
#import "ImageAnalyzer.h"
#import "EnclosedAreaColorPicker.h"

@interface AddInformationViewController () <EnclosedAreaColorPickerDelegate>
{
    __weak IBOutlet UIImageView *_lunchBoxImageView;
    RegisteredDishTableViewController *_dishTableViewController;
    
    EnclosedAreaColorPicker *_colorPicker;
}

@property (nonatomic, strong) NSMutableArray *dishItems;

@end

@implementation AddInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initFields];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

# pragma mark - init
- (void)initFields
{
    self.dishItems = [NSMutableArray new];
    
    _colorPicker = [[EnclosedAreaColorPicker alloc] initWithTargetView:_lunchBoxImageView];
    _colorPicker.delegate = self;
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"RegisteredDishTable"]) {
        _dishTableViewController = (RegisteredDishTableViewController *)segue.destinationViewController;
        _dishTableViewController.dishes = self.dishItems;
    }
}

#pragma mark - DrawLayerView delegate
- (void)drawLayerView:(DrawLayerView*)drawLayerView drawnImage:(UIImage*)image
{
    // TODO: 並列処理
    DishItem *dishItem = [[DishItem alloc] initWithLunchBox:imageFromView(_lunchBoxImageView) contourImage:image];
//    [self.dishItems addObject:dishItem];
    [self.dishItems insertObject:dishItem atIndex:0];
    
    _dishTableViewController.dishes = self.dishItems;
    [_dishTableViewController.tableView reloadData];
    [drawLayerView clearImage];
}

#pragma mark - EnclosedAreaColorPickerDelegate
- (void)enclosedAreaColorPicker:(EnclosedAreaColorPicker*)enclosedAreaColorPicker result:(EnclosedAreaColorPickerResult*)result
{
//    // TODO: 並列処理
//    DishItem *dishItem = [[DishItem alloc] initWithLunchBox:imageFromView(_lunchBoxImageView) contourImage:image];
//    //    [self.dishItems addObject:dishItem];
//    [self.dishItems insertObject:dishItem atIndex:0];
//    
//    _dishTableViewController.dishes = self.dishItems;
//    [_dishTableViewController.tableView reloadData];
//    [_colorPicker clearLine];
}

@end
