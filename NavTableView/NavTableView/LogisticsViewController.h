//
//  LogisticsViewController.h
//  snstaoban
//
//  Created by Tommy on 13-5-20.
//  Copyright (c) 2013年 Bo Xiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogisticsViewController : UITableViewController
{
    NSArray * dataSource;
    NSMutableArray * cellArray;
}


typedef enum _LogisticState
{
    LogisticStatePayed = 0,
    LogisticStatePackaged,
    LogisticStateShipping,
    LogisticStateDeliving,
    LogisticStateRecipted
}LogisticState;

@property (nonatomic,retain) NSMutableArray * cellArray;


- (id) cellObjAtIndexPath:(NSIndexPath *)indexPath;

//query logistics info list
- (void) queryLogisticsInfo;

//get cell level

- (NSUInteger) levelAtIndexPath:(NSIndexPath *)indexPath;
- (LogisticState) logisticStateAtIndexPath:(NSIndexPath *)indexPath;
- (void) configForCell:(UITableViewCell *)cell AtIndexPath:(NSIndexPath *)indexPath;



@end
