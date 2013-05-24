//
//  tomCustomDetailHeaderView.h
//  NavTableView
//
//  Created by Tommy on 13-5-21.
//  Copyright (c) 2013年 Tommy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tomCustomDetailHeaderView : UIView
{
    UIImageView * imageView;
    UILabel*      textLabel;
    UILabel*      detailTextLabel;
    
    
    NSString*     imageName;
    NSString*     text;
    NSString*     detailText;
}




@property(nonatomic,retain) UIImageView * imageView;
@property(nonatomic,retain) UILabel * textLabel;
@property(nonatomic,retain) UILabel * detailTextLabel;


@property(nonatomic,retain) NSString* imageName;
@property(nonatomic,retain) NSString* text;
@property(nonatomic,retain) NSString* detailText;

@end
