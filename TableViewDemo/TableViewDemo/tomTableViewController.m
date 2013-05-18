//
//  tomTableViewController.m
//  TableViewDemo
//
//  Created by Tommy on 13-5-16.
//  Copyright (c) 2013年 Tommy. All rights reserved.
//

#import "tomTableViewController.h"

@interface tomTableViewController ()

@end

@implementation tomTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _label.text = @"dddd";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
