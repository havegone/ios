//
//  tomDetailLogisticsViewController.h
//  NavTableView
//
//  Created by Tommy on 13-5-21.
//  Copyright (c) 2013年 Tommy. All rights reserved.
//

#import <UIKit/UIKit.h>



@class tomDetailLogisticsTableViewController;
@class tomCustomDetailHeaderView;
@interface tomDetailLogisticsViewController : UIViewController
{
    tomCustomDetailHeaderView * headerView;
    tomDetailLogisticsTableViewController * tableViewController;
    
}

- (void)popToRootVC;
- (void)popItemVC;

@end
