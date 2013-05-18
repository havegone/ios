//
//  tomRootViewController.m
//  TableViewDemo
//
//  Created by Tommy on 13-5-16.
//  Copyright (c) 2013年 Tommy. All rights reserved.
//

#import "tomRootViewController.h"
#import "tomTableViewController.h"
#import "tomxxxTableViewController.h"

@interface tomRootViewController ()

@end


@implementation tomRootViewController

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
    
    /*
    UIButton * showBtn = [[UIButton alloc] initWithFrame:CGRectMake(30,30,50,50)];
    
    showBtn.backgroundColor = [UIColor redColor];
    
    [showBtn setTitle:@"show" forState:UIControlStateNormal];//<#(UIControlState)#>
    [showBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [showBtn addTarget:self action:@selector(onPress:) forControlEvents:UIControlEventTouchUpInside];
     
     
     [self.view addSubview:showBtn];
     */
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
     
     
     //*******************************************************************************

- (IBAction)onPress:(UIButton *)sender {
    
    //[sender setEnabled:NO];
    sender.titleLabel.text = @"press";
    
    //这里使用展示方式跳转到LLViewController
    tomxxxTableViewController *viewController = [[tomxxxTableViewController alloc] initWithNibName:@"tomxxxTableViewController" bundle:nil];
    [self presentViewController:viewController animated:YES completion:^{
        
        NSLog(@"XXXXXXX");
        
    }];
    
}

- (IBAction)onPressDown:(UIButton *)sender
{
     sender.titleLabel.text = @"press";
}


- (void)dealloc {
    [_label release];
   
    [super dealloc];
}
@end
