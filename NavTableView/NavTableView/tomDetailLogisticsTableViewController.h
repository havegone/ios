//
//  tomTableViewController.h
//  NavTableView
//
//  Created by Tommy on 13-5-21.
//  Copyright (c) 2013年 Tommy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tomDetailLogisticsTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    CGRect frame;
    UIViewController* superController;
}

@property(nonatomic,weak)UIViewController* superController;

- (id) initWithFrame:(CGRect)frame;

- (void) setFrame:(CGRect)frame;
- (CGRect) getFrame;
//use to should add additonal empty cell 
- (BOOL) isNeedAddtionalCell;





@end
