//
//  MyTabBarViewController.h
//  snstaoban
//
//  Created by Tommy on 13-6-20.
//  Copyright (c) 2013年 Bo Xiu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TomTabBar.h"
#import "TomTabBarItem.h"


@class TomTabBar;
@class MyTabBarViewController;
@class TomTransitionView;

@protocol TomTabBarViewControllerDelegate <NSObject>

- (BOOL)tabBarController:(MyTabBarViewController *)tabBarController shouldSelectViewController:(UIViewController *)viewController;
- (void)tabBarController:(MyTabBarViewController *)tabBarController didSelectViewController:(UIViewController *)viewController;

@end

@interface MyTabBarViewController : UIViewController<TomTabBarDelegate>

//@property (nonatomic,retain) TomTransitionView * transitionView;
@property (nonatomic,retain) TomTabBar * tabBar;
@property (nonatomic,retain) NSArray * viewControllers;
@property (nonatomic,assign) id<TomTabBarViewControllerDelegate> delegate;
@property (nonatomic,assign) int selectedIndex;
@property (nonatomic,assign) CGRect transitionsFrame;


- (void) selectItem:(NSUInteger)index;

- (void) setViewControllers:(NSArray*) vcs;
@end
