//
//  tomMainViewController.m
//  NavTableView
//
//  Created by Tommy on 13-5-17.
//  Copyright (c) 2013年 Tommy. All rights reserved.
//

#import "tomMainViewController.h"
#import "tomTablePlainViewController.h"
#import "tomTableGroupViewController.h"

@interface tomMainViewController ()

@end

@implementation tomMainViewController

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
    // Do any additional setup after loading the view from its nib.
    //[self.navigationController.navigationBar setHidden:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showPlainTable:(id)sender {
    
  
     tomTablePlainViewController * tablePlainViewController = [[tomTablePlainViewController alloc] initWithNibName:@"tomTablePlainViewController" bundle:nil];
    
    
    [self.navigationController pushViewController:tablePlainViewController animated:YES];
     
}

- (IBAction)showGroupTable:(id)sender {
    
    tomTableGroupViewController * tableGroupViewController = [[tomTableGroupViewController alloc] initWithNibName:@"tomTableGroupViewController" bundle:nil];
    
    [tableGroupViewController initWithStyle:UITableViewStyleGrouped];
    
    [self.navigationController pushViewController:tableGroupViewController animated:YES];
    
}
@end
