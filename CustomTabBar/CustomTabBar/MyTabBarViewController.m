//
//  MyTabBarViewController.m
//  snstaoban
//
//  Created by Tommy on 13-6-20.
//  Copyright (c) 2013年 Bo Xiu. All rights reserved.
//

#import "MyTabBarViewController.h"
#import "TomTabBar.h"


@interface TomTransitionView:UIView

@end


@implementation TomTransitionView


-(void) addSubview:(UIView *)view
{
    [super addSubview:view];
}
- (void)insertSubview:(UIView *)view belowSubview:(UIView *)siblingSubview
{
    [super insertSubview:view belowSubview:siblingSubview];
}
- (void)insertSubview:(UIView *)view aboveSubview:(UIView *)siblingSubview
{
    [super insertSubview:view aboveSubview:siblingSubview];
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
}

- (void)insertSubview:(UIView *)view atIndex:(NSInteger)index
{
    [super insertSubview:view atIndex:index];
}
@end



@interface MyTabBarViewController ()
{
    UIViewController* currentVC;
}
- (void) initViews;
@end

@implementation MyTabBarViewController
//@synthesize selectedIndex;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self initViews];
    }
    return self;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id) init
{
    if (self = [super init])
    {
        [self initViews];
        
    }
    return  self;
}

- (void) initViews
{
    if(_tabBar)
        return;
    CGRect frame = [[UIScreen mainScreen] applicationFrame];
    CGRect tabBarFrame = frame;
    
    
    _transitionsFrame = frame;
    _transitionsFrame.origin.y = 0;
    _transitionsFrame.size.height =  frame.size.height - [TomTabBar tabBarHeight] - 10;

    /*
     CGRect transitionFrame = frame;
    _transitionFrame.origin.y = 0;
    _transitionFrame.size.height = frame.size.height - [TomTabBar tabBarHeight] - 10;
   
    _transitionView = [[TomTransitionView alloc] initWithFrame:transitionFrame];
    _transitionView.backgroundColor = [UIColor clearColor];
    */
    
    tabBarFrame.origin.y = frame.size.height - [TomTabBar tabBarHeight];
    tabBarFrame.size.height = [TomTabBar tabBarHeight];
    
    _tabBar = [[TomTabBar alloc] initWithFrame:tabBarFrame];
    _tabBar.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.5];
    _tabBar.selectionGradientColor  = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    _tabBar.delegate = self;

}
 
- (void) loadView
{    
    CGRect frame = [[UIScreen mainScreen] applicationFrame];
    
    self.view = [[UIView alloc] initWithFrame:frame];
    self.view.backgroundColor = [UIColor blackColor];
    

    
    //[self.view addSubview:_transitionView];
    [self.view addSubview:_tabBar];
       
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self selectItem:0];

}

- (void) setViewControllers:(NSArray*) vcs
{
    _viewControllers = [NSMutableArray arrayWithArray:vcs];
    //[self.view setNeedsDisplay];
    //[self.tabBar setNeedsDisplay];
}

- (void) selectItem:(NSUInteger)index
{
    [self tabBar:_tabBar selectedItemWithIndex:index];
}



-(void) tabBar:(TomTabBar*)tabBar selectedItemWithIndex:(NSInteger)index;
{
    UIViewController* vc = [_viewControllers objectAtIndex:index];
    
    if(_delegate == nil || ([_delegate tabBarController:self shouldSelectViewController:vc ]))
    {
        vc.view.frame = _transitionsFrame;//self.transitionView.frame;
    
        [currentVC.view removeFromSuperview];
        currentVC = vc;
        //[_transitionView addSubview:vc.view];
        
        //[self.view insertSubview:vc.view belowSubview:self.tabBar];
        [self.view addSubview:vc.view];
    }
       
}



@end
