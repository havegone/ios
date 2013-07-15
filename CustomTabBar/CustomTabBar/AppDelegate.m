//
//  AppDelegate.m
//  CustomTabBar
//
//  Created by Tommy on 13-6-20.
//  Copyright (c) 2013年 Tommy. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"
#import "MyTabBarViewController.h"



@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    //self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    
    ViewController* vc = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    vc.text = @"first";
    
    ViewController* vc2 = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    vc2.text = @"second";
    
    ViewController* vc3 = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    vc3.text = @"thrid";
    
    
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:vc3];
    
    self.viewController = [[MyTabBarViewController alloc] init];
    self.viewController.viewControllers = @[vc,vc2,nav];
    
    
    TomTabBarItem * item = [[TomTabBarItem alloc]init];
    [item initWithTitle:@"first" NormalImage:[UIImage imageNamed:@"basket"] HighlightedImage:[UIImage imageNamed:@"Beer"]];
    TomTabBarItem * item2 = [[TomTabBarItem alloc]init];
    [item2 initWithTitle:@"second" Image:[UIImage imageNamed:@"Beer"]];
    TomTabBarItem * item3 = [[TomTabBarItem alloc]init];
    [item3 initWithTitle:@"thrid" Image:[UIImage imageNamed:@"Money-Bag"]];
    //[self.viewController.tabBar setTabBarItems:[NSArray arrayWithObjects:item, nil]];
    self.viewController.tabBar.tabBarItems = @[item,item2,item3];
    
    self.window.rootViewController = self.viewController;
    
    [self.window makeKeyAndVisible];
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
