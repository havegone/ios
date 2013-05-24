//
//  tomLogisticsViewController.h
//  NavTableView
//
//  Created by Tommy on 13-5-22.
//  Copyright (c) 2013年 Tommy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class tomCustomLogisticsHeaderView;
@class LogisticsTableViewController;
@class tomDetailLogisticsTableViewController;

@interface tomLogisticsViewController : UIViewController
{
    tomCustomLogisticsHeaderView * headerView;
    LogisticsTableViewController * tableViewController;
}

- (void)popToRootVC;
- (void)popItemVC;

@end
