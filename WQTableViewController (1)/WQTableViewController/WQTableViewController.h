//
//  WQTableViewController.h
//  lazyTableUpdate
//
//  Created by Bob Wu on 12-5-9.
//  Copyright (c) 2012年 veex. All rights reserved.
//

#define KimageKey @"image"  ///为数组中每个item中存放图片URL的key名字
#define KidKey @"id"    ///为数组中每个item的id  用于缓存之用


#import <UIKit/UIKit.h>
@protocol WQTableViewDelegate
@required
    -(void)cellImageDidLoad:(NSIndexPath *)indexPath image:(UIImage *)image;

@end

@interface WQTableViewController : UIViewController <UIScrollViewDelegate,UITableViewDelegate>
{
@public
    id <WQTableViewDelegate> delegate;
    NSMutableArray *tableDataArray;
    UITableView *wqTable;
}

 
@end
