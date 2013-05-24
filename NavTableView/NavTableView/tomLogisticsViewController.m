//
//  tomLogisticsViewController.m
//  NavTableView
//
//  Created by Tommy on 13-5-22.
//  Copyright (c) 2013年 Tommy. All rights reserved.
//

#import "tomLogisticsViewController.h"
#import "tomCustomDetailHeaderView.h"
#import "LogisticsTableViewController.h"
#import "tomDetailLogisticsTableViewController.h"


#define HeaderViewX         8
#define HeaderViewY         8
#define HeaderVeiwHeight    60
#define ViewSep             5
#define TableViewY          (HeaderViewY + HeaderVeiwHeight + ViewSep)


@interface tomCustomLogisticsHeaderView : tomCustomDetailHeaderView

#define DefaultImagePointX  10
#define DefaultImagePointY  10
#define DefaultImageWidth   40
#define DefaultImageHeight  40
#define ImageSep            8

#define LablePointX        (DefaultImagePointX+DefaultImageWidth+ImageSep)
#define LablePointY        (DefaultImagePointY)


#define LableSep            4
#define LableToRight        15
#define LableWidth(_viewWidth)  (_viewWidth - LablePointX -LableToRight)
#define LableHeight(_viewHeight)  (23)


#define DetaileLabelPointX  LablePointX
#define DetaileLabelPointY(_labelHight)  (LablePointY + _labelHight + LableSep)
#define DetaileLabelToBottom 10

@end


@implementation tomCustomLogisticsHeaderView


/*
@synthesize imageView = _imageView;
@synthesize textLabel = _textLabel;
@synthesize detailTextLabel = _detailTextLabel;
@synthesize imageName = _imageName;
@synthesize text = _text;
@synthesize detailText = _detailText;

*/


- (void) drawRect:(CGRect)rect
{
    // Drawing code
    
  //  static NSString * DefaultFontName = @"Georgia";
    static float LabelFontSize = 20;
    static float DetailLabelFontSize = 14;
    
    
    
    UIImage* image = [UIImage imageNamed:imageName];
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(DefaultImagePointX,DefaultImagePointY,DefaultImageWidth,DefaultImageHeight)];
    imageView.backgroundColor = [UIColor clearColor];
    imageView.image = image;
    
    
    textLabel = [[UILabel alloc] initWithFrame:CGRectMake(LablePointX,LablePointY,LableWidth(rect.size.width),LableHeight(rect.size.height))];
    textLabel.backgroundColor = [UIColor clearColor];
	textLabel.opaque = NO;
	textLabel.textColor = [UIColor whiteColor];
	//textLabel.highlightedTextColor = [[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.9] colorWithAlphaComponent:0.9];
    textLabel.font  = [UIFont fontWithName:textLabel.font.fontName size:LabelFontSize];
    textLabel.text = text;
    
    
    detailTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(DetaileLabelPointX,DetaileLabelPointY(textLabel.frame.size.height), textLabel.frame.size.width,textLabel.frame.size.height-DetaileLabelToBottom)];
    detailTextLabel.backgroundColor = [UIColor clearColor];
	detailTextLabel.opaque = NO;
	detailTextLabel.textColor = [[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.7] colorWithAlphaComponent:0.7];
    detailTextLabel.font  = [UIFont fontWithName:detailTextLabel.font.fontName size:DetailLabelFontSize];
    detailTextLabel.text = detailText;
    
    
    
    [self addSubview:imageView];
    [self addSubview:textLabel];
    [self addSubview:detailTextLabel];
    
}


@end



@interface tomLogisticsViewController ()

@end

@implementation tomLogisticsViewController

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
    
    
    headerView = [[tomCustomLogisticsHeaderView alloc] initWithFrame:rectHeaderView];
    tableViewController = [[LogisticsTableViewController alloc] initWithFrame:rectTableView];
    tableViewController.superController = self;
    //tableViewController.navigationController = self.navigationController;
    //tableViewController = [[tomDetailLogisticsTableViewController alloc] initWithFrame:rectTableView];
    //headerView.backgroundColor = [[UIColor colorWithRed:0 green:0 blue:0 alpha:0.50] colorWithAlphaComponent:0.5];
    
    UIImage* image = [UIImage imageNamed:@"top_bg@2x"];
    headerView.backgroundColor = [[UIColor colorWithPatternImage:image] colorWithAlphaComponent:0.8];

    headerView.text = @"物流通知";
    headerView.detailText = @"随时查看你的宝贝到哪里";
    headerView.imageName = @"transportationicon@2x";
    
    
    
    [self.view addSubview:headerView];
    [self.view addSubview:tableViewController.view];
    
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]];
    
    
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:self action:@selector(popItemVC)];
    UIBarButtonItem *home = [[UIBarButtonItem alloc] initWithTitle:@"Home" style:UIBarButtonItemStyleBordered target:self action:@selector(popToRootVC)];
    
    [self setToolbarItems:[NSArray arrayWithObjects:back,home, nil]];
    
    
    [self.navigationController setToolbarHidden:NO];//.toolbarHidden = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (void)popToRootVC
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)popItemVC
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
