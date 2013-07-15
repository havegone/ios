//
//  AppDelegate.h
//  CustomTabBar
//
//  Created by Tommy on 13-6-20.
//  Copyright (c) 2013年 Tommy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;
@class MyTabBarViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//@property (strong, nonatomic) ViewController *viewController;
@property (strong, nonatomic) MyTabBarViewController * viewController;

@end
