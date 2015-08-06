//
//  AddInformationViewController.m
//  memo
//
//  Created by ezura on 6/27/15.
//  Copyright (c) 2015 ezura. All rights reserved.
//

#import "AddInformationViewController.h"
#import "Dish.h"
#import "RegisteredDishTableViewController.h"
#import "ImageAnalyzer.h"
#import "EnclosedAreaColorPicker.h"

@interface AddInformationViewController () <EnclosedAreaColorPickerDelegate>
{
    __weak IBOutlet UIImageView *_lunchBoxImageView;
    RegisteredDishTableViewController *_dishTableViewController;
    
    EnclosedAreaColorPicker *_colorPicker;
}

@property (nonatomic, strong) NSMutableArray *dishs;

@end

@implementation AddInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initFields];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

# pragma mark - init
- (void)initFields
{
    self.dishs = [NSMutableArray new];
    
    _colorPicker = [EnclosedAreaColorPicker new];
    _colorPicker.pickTargetView = _lunchBoxImageView;
    _colorPicker.delegate = self;
    _colorPicker.drawView.frame = _lunchBoxImageView.bounds;
    [self.view addSubview:_colorPicker.drawView];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"RegisteredDishTable"]) {
        _dishTableViewController = (RegisteredDishTableViewController *)segue.destinationViewController;
        _dishTableViewController.dishes = self.dishs;
    }
}

#pragma mark - EnclosedAreaColorPickerDelegate
- (void)enclosedAreaColorPicker:(EnclosedAreaColorPicker*)enclosedAreaColorPicker result:(EnclosedAreaColorPickerResult*)result
{
    Dish *dish = [Dish dishWithEnclosedAreaColorPickerResult:result];
    [self.dishs insertObject:dish atIndex:0];
    _dishTableViewController.dishes = self.dishs;
    
    [_dishTableViewController.tableView reloadData];
    [_colorPicker clearLine];
}

@end
