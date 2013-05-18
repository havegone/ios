//
//  tomNavViewController.m
//  NavTableView
//
//  Created by Tommy on 13-5-17.
//  Copyright (c) 2013年 Tommy. All rights reserved.
//

#import "tomNavViewController.h"

#import "tomMainViewController.h"

@interface tomNavViewController ()

@end

@implementation tomNavViewController

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
	// Do any additional setup after loading the view.
    
    
   // tomMainViewController * mainViewController = [[tomMainViewController alloc] initWithNibName:@"tomMainViewController" bundle:nil];
    [self.navigationBar setHidden:YES];
    //[self setToolbarHidden:NO];
    //[self.toolbar.]
    
   // [self setTitle:@"Nav"];
    
    //self.navigationItem.backBarButtonItem.title=@"ddddd";
    
    //[self addChildViewController:mainViewController];
  //  [self addChildViewController:tablePlainViewController];
   // [self addChildViewController:tablePlainViewController];
    
    
    
    /*
    
    // set rightItem
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"Root" style:UIBarButtonItemStyleBordered target:self action:@selector(popToRootVC)];
    childOne.navigationItem.rightBarButtonItem = rightItem;
    [rightItem release];
    
    // when you design a prompt for navigationbar, the hiehgt of navigationbar will becaome 74, ignore the orientation
    childOne.navigationItem.prompt = @"Hello, im the prompt";
    
    */
    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSLog(@"will show");
}
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSLog(@"did show");
}

@end
