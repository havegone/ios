//
//  ViewController.h
//  CustomTabBar
//
//  Created by Tommy on 13-6-20.
//  Copyright (c) 2013年 Tommy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *lable;

@property (strong,nonatomic) NSString* text;
- (IBAction)chage:(id)sender;
- (IBAction)cancel:(id)sender;

@end
