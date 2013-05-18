//
//  tomRootViewController.h
//  TableViewDemo
//
//  Created by Tommy on 13-5-16.
//  Copyright (c) 2013年 Tommy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tomRootViewController : UIViewController
@property (retain, nonatomic) IBOutlet UILabel *label;

- (IBAction)onPress:(UIButton *)sender;
- (IBAction)onPressDown:(UIButton *)sender;


@end
