//
//  tomWuliuViewController.h
//  NavTableView
//
//  Created by Tommy on 13-5-20.
//  Copyright (c) 2013年 Tommy. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface WuliuHeaderView:UIView
{
    NSString * imageName;
    NSString * text;
    NSString * detaiText;
}


@property (nonatomic,retain) NSString * imageName;
@property (nonatomic,retain) NSString * text;
@property (nonatomic,retain) NSString * detailText;



@end

@interface tomWuliuViewController : UIViewController




- (void) initHeaderView;


@end
