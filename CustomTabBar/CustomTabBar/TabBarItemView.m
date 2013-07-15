//
//  TabBarItemView.m
//  CustomTabBar
//
//  Created by Tommy on 13-6-21.
//  Copyright (c) 2013年 Tommy. All rights reserved.
//

#import "TabBarItemView.h"
#import "TomTabBarItem.h"



@implementation TabBarItemView

+ (TabBarItemView *) tabBarItemView:(id<TabBarItemViewDelegate>) aDelegate  withFrame:(CGRect) frame withTomTabBarItem:(TomTabBarItem *) anItem
{
    float itemWidth = frame.size.width;
    float itemHeight = frame.size.height;
    TabBarItemView * itemView = [[TabBarItemView alloc] initWithFrame:frame];
    itemView.delegate = aDelegate;
    itemView.imageView = [[UIImageView alloc] initWithImage:anItem.normalImage highlightedImage:anItem.highlightedImage];
    itemView.label = [[UILabel alloc] init];
    
    itemView.imageView.frame = CGRectMake(10, 5, itemWidth-20, itemHeight/10*5 -5);
    itemView.label.frame = CGRectMake(10, 5 + itemHeight/10*5, itemWidth-20, itemHeight/10*5 - 15);
    
    
    [itemView.imageView setContentMode:UIViewContentModeScaleAspectFit];
    
    [itemView.label setText:anItem.title];
    [itemView.label setContentMode:UIViewContentModeScaleAspectFit];
    [itemView.label setFont:[UIFont systemFontOfSize:12.0f]];
    [itemView.label setTextAlignment:UITextAlignmentCenter];
    [itemView.label setBackgroundColor:[UIColor clearColor]];
    [itemView.label setTextColor:[UIColor whiteColor]];
    [itemView.label setLineBreakMode:UILineBreakModeMiddleTruncation];
    
    [itemView addSubview:itemView.label];
    [itemView addSubview:itemView.imageView];
    
    if(itemView.delegate){
        [itemView.delegate didCreationTabBarItemView:itemView withTomTabBarItem: anItem];
    }
    return itemView;
}

@end
