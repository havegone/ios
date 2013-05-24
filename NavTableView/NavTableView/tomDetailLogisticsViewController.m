//
//  tomDetailLogisticsViewController.m
//  NavTableView
//
//  Created by Tommy on 13-5-21.
//  Copyright (c) 2013年 Tommy. All rights reserved.
//

#import "tomDetailLogisticsViewController.h"
#import "tomCustomDetailHeaderView.h"
#import "tomDetailLogisticsTableViewController.h"

@interface tomDetailLogisticsViewController ()


#define HeaderViewX         8
#define HeaderViewY         8
#define HeaderVeiwHeight    70
#define ViewSep             5
#define TableViewY          (HeaderViewY + HeaderVeiwHeight + ViewSep)

@end

@implementation tomDetailLogisticsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    
    CGRect rectHeaderView,rectTableView;
    CGRect rectView;
    
    
    rectView = self.view.bounds;
    rectHeaderView = CGRectMake(HeaderViewX,HeaderViewY,rectView.size.width -  HeaderViewX * 2,  HeaderVeiwHeight);
    rectTableView = CGRectMake(HeaderViewX, TableViewY , rectHeaderView.size.width, rectView.size.height - TableViewY - 20);
    
    
    headerView = [[tomCustomDetailHeaderView alloc] initWithFrame:rectHeaderView];
    tableViewController = [[tomDetailLogisticsTableViewController alloc] initWithFrame:rectTableView];
    tableViewController.superController = self;
    headerView.backgroundColor = [[UIColor colorWithRed:0 green:0 blue:0 alpha:0.50] colorWithAlphaComponent:0.5];
    

    
    headerView.text = @"阿萨德dasdfasdf发送到发阿萨德发送到发";
    headerView.detailText = @"阿斯蒂芬撒地方撒旦法士大夫";
    headerView.imageName = @"11";
    
  
    
    [self.view addSubview:headerView];
    [self.view addSubview:tableViewController.view];
    

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]];
    
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:self action:@selector(popItemVC)];
    UIBarButtonItem *home = [[UIBarButtonItem alloc] initWithTitle:@"Home" style:UIBarButtonItemStyleBordered target:self action:@selector(popToRootVC)];
    
    [self setToolbarItems:[NSArray arrayWithObjects:back,home, nil]];
    [self.navigationController setToolbarHidden:NO];//.toolbarHidden = NO;

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
   

    CGRect rectHeaderView,rectTableView;
    CGRect rectView;
    
    
    rectView = self.view.bounds;
    rectHeaderView = CGRectMake(HeaderViewX,HeaderViewY,rectView.size.width -  HeaderViewX * 2,  HeaderVeiwHeight);
    rectTableView = CGRectMake(HeaderViewX, TableViewY , rectHeaderView.size.width, rectView.size.height - TableViewY);
    
    
    headerView.frame = rectHeaderView;
    tableViewController.view.frame =  rectTableView;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)popToRootVC
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)popItemVC
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
