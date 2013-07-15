//
//  ViewController.m
//  CustomTabBar
//
//  Created by Tommy on 13-6-20.
//  Copyright (c) 2013年 Tommy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _lable.text = _text;
    //[self.navigationController setHidesBottomBarWhenPushed:YES];
    [self.navigationController.navigationBar setHidden:YES];
    [self.view setBackgroundColor:[UIColor blueColor]];
    /*
    if(self.navigationController == nil)
    {
        CGRect frame = [[UIScreen mainScreen] applicationFrame];
        frame.origin.y = 0;
        frame.size.height = 50;
        self.view.frame = frame;
        self.view.backgroundColor = [UIColor whiteColor];
    }
    
    CGRect frame = self.view.frame;
    
    */
    
    NSLog(@"");
    //self.view.frame = [[UIScreen mainScreen] applicationFrame];
}

- (void) viewDidAppear:(BOOL)animated
{
    //
    
    [super viewDidAppear:animated];
    
    /*
    if(self.navigationController == nil)
    {
        CGRect frame = [[UIScreen mainScreen] applicationFrame];
        frame.origin.y = 0;
        frame.size.height = 50;
        self.view.frame = frame;
        self.view.backgroundColor = [UIColor whiteColor];
    }
    CGRect frame = self.view.frame;
    
    */
    NSLog(@"");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {

    [super viewDidUnload];
}
- (IBAction)chage:(id)sender {
    
    ViewController* vc3 = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    
   // vc3.view.frame = [[UIScreen mainScreen] applicationFrame];
    //vc3.view.backgroundColor = [UIColor blueColor];
    
    //CGRect frame =  [[UIScreen mainScreen] applicationFrame];//vc3.view.frame;
    //frame.size.height = 40;
    
    //vc3.view.frame = frame;
    
   // vc3.modalPresentationStyle = UIModalPresentationCurrentContext;
    
    if(self.navigationController)
    {
        vc3.text = @"change in nav";
        //[self presentModalViewController:vc3 animated:YES];
        [self.navigationController pushViewController:vc3 animated:YES];
    }
    else
    {
        vc3.text = @"change in modal";
        [self presentModalViewController:vc3 animated:YES];
        //[self presentViewController:vc3 animated:YES completion:nil];
    }
     NSLog(@"");
}

- (IBAction)cancel:(id)sender {
    
    NSLog(@"");
    if(self.navigationController)
    {
       // [self dismissModalViewControllerAnimated:YES];
        [self.navigationController popViewControllerAnimated:YES];
    }
    else{
        //[[self parentViewController]dismissModalViewControllerAnimated:YES];
        [self dismissModalViewControllerAnimated:YES];
    }
    
    NSLog(@"");

}
@end
