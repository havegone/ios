//
//  TabBarItemView.h
//  CustomTabBar
//
//  Created by Tommy on 13-6-21.
//  Copyright (c) 2013年 Tommy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TomTabBarItem;
@class TomTabBar;
@class TabBarItemView;


@protocol TabBarItemViewDelegate <NSObject>

- (void) didCreationTabBarItemView:(TabBarItemView *) itemView withTomTabBarItem:(TomTabBarItem *) anItem;

@end


@interface TabBarItemView :UIView

@property (nonatomic,retain) UIImageView * imageView;
@property (nonatomic,retain) UILabel * label;
@property (nonatomic,assign) TomTabBarItem * item;
@property (nonatomic,assign) id<TabBarItemViewDelegate>  delegate;



+ (TabBarItemView *) tabBarItemView:(id<TabBarItemViewDelegate>) aDelegate  withFrame:(CGRect) frame withTomTabBarItem:(TomTabBarItem *) anItem;

@end
