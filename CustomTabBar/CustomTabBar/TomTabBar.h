//
//  TomTabBar.h
//  snstaoban
//
//  Created by Tommy on 13-6-20.
//  Copyright (c) 2013年 Bo Xiu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBarItemView.h"

@class TomTabBarItem;
@class TomTabBar;

@protocol TomTabBarDelegate <NSObject>

-(void) tabBar:(TomTabBar*)tabBar selectedItemWithIndex:(NSInteger)index;

@end



@interface TomTabBar : UIView<TabBarItemViewDelegate>


@property (nonatomic,retain) TomTabBarItem* selectedItem;
@property (nonatomic,retain) NSArray * tabBarItems;
@property (nonatomic,assign) id <TomTabBarDelegate> delegate;

@property (nonatomic,assign)BOOL drawImage;
@property (nonatomic,assign)BOOL drawTitle;
@property (nonatomic,assign)BOOL showSeparationBetweenItems;
@property (nonatomic,assign)BOOL showSelectedItem;
@property (nonatomic,retain)UIColor * foregroundColor;
@property (nonatomic,retain)UIColor * backgroundColor;
@property (nonatomic,retain)UIColor * separatorColor;
@property (nonatomic,retain)UIColor * selectionGradientColor;



- (void)setTabBarItems:(NSArray*) items;


+ (NSInteger) tabBarHeight;

@end


