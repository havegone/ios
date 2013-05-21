//
//  tomTableGroupViewController.m
//  NavTableView
//
//  Created by Tommy on 13-5-17.
//  Copyright (c) 2013年 Tommy. All rights reserved.
//

#import "tomTableGroupViewController.h"
#import "tomTableDataModel.h"
#import "tomCustomTableCell.h"


@interface CustomView : UIView
@property (nonatomic, strong) NSString *model;

@end
@implementation CustomView
@synthesize model = _model;

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //*******************************************************************************
        //设置 背景透明或其他颜色，不然多次重绘时之前绘制的内容都还在，会叠加到一块儿
        //*******************************************************************************
        self.backgroundColor = [UIColor clearColor];
    }
    
    self.model = @"asdfasdfasdfasdf";
    return self;
}

- (void)drawRect:(CGRect)rect{
    //*******************************************************************************
    //绘制Cell内容，NSString UIImage 等有drawInRect或者drawAtPoint 方法的都可以在这里绘制
    //*******************************************************************************
    [[UIColor redColor] set];
    //[self]
    
    //绘制一张图片
    UIImage *image = [UIImage imageNamed:@"2013"];
    //[image drawAtPoint:CGPointMake(5, 5)];
    [image drawInRect:CGRectMake(5, 5, 50, 50)];
    
    //绘制一个字符串 drawInRect: 在某个区域内 withFont: 以什么字体
    [_model drawInRect:CGRectMake(5, 5, 200, 30) withFont:[UIFont systemFontOfSize:18]];
    //[image drawInRect:CGRectMake(5, 5, 50, 50)];
    
    [[UIColor greenColor] set];
    //绘制图形
    CGContextRef context = UIGraphicsGetCurrentContext();
	UIGraphicsPushContext(context);
	CGContextBeginPath(context);
    //*******************************************************************************
    //这之间的内容决定你画的是什么图形
	//CGContextAddArc(context, 70, 40, 10, 0.0, 2*M_PI, NO);// (70, 40)为圆心 10 是半径
    //这之间的内容决定你画的是什么图形
    //*******************************************************************************
	CGContextFillPath(context);
	UIGraphicsPopContext();
    //*******************************************************************************
    //根据需要，你可以在这里绘制Cell内容来定制你的cell
    //那些不需要响应点击等事件的元素都可以绘制到CustomView上
    //需要响应点击事件等的UIView，如UIButton则需要addSubview到cell.contentView上
    //*******************************************************************************
}

- (void)setModel:(NSString *)model{
    _model = model;
    //这里setNeedsDisplay 重绘自己
    [self setNeedsDisplay];
}
@end

@interface UICustomCell:UITableViewCell
{
    CustomView *cView;
}


@end


@implementation UICustomCell



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self.textLabel setHidden:YES];
        [cView removeFromSuperview];

       CustomView* cView = [[CustomView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        
        cView.backgroundColor = [[UIColor colorWithRed:0 green:0.161 blue:0.047 alpha:1.00] colorWithAlphaComponent:0.9];
        
        [self.contentView addSubview:cView];
        
    }
    
    return  self;
    
}

@end






@interface tomTableGroupViewController ()

@end

@implementation tomTableGroupViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.navigationController.navigationBar setHidden:YES];
    self.clearsSelectionOnViewWillAppear = NO;
    
    dataModel = [[tomTableDataModel alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    NSLog(@"section count:%d",[dataModel sectionCount]);
    return [dataModel sectionCount];
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.

    
    NSLog(@"row count:%d for:%d",[dataModel rowCount:section],section);
    
    return [dataModel rowCount:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    /*
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    */
    
    
    
    UICustomCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UICustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    NSLog(@"section:%d row:%d cell for %@",indexPath.section,indexPath.row,[dataModel objectAtIndexPath:indexPath]);
    cell.textLabel.text = [dataModel objectAtIndexPath:indexPath];
    cell.indentationLevel = [dataModel levelAtIndexPath:indexPath];
    cell.accessoryType =  cell.indentationLevel==0?UITableViewCellAccessoryDisclosureIndicator:UITableViewCellAccessoryNone;
    
    // Configure the cell...
    
    
    if (cell.indentationLevel == 0) {
         cell.imageView.image = [UIImage imageNamed:@"2013"];    }
    
    
   
    
    
    
    
    
    
    
    return cell;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    

	// create the parent view
	UIView * customSectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320,83)];
    
    customSectionView.backgroundColor = [[UIColor colorWithRed:0.3 green:0.161 blue:0.047 alpha:1.00] colorWithAlphaComponent:0.9];
    
    UIView * headerView = [[UIView alloc] initWithFrame:CGRectMake(8, 8, 304,70) ];
    headerView.backgroundColor = [[UIColor colorWithRed:0 green:0.161 blue:0.047 alpha:1.00] colorWithAlphaComponent:0.9];
    

    //[[UIColor colorWithRed:0 green:0.161 blue:0.047 alpha:0.500] colorWithAlphaComponent:0.9];
	
    
    UIView * imageView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 50,50) ];
    imageView.backgroundColor = [UIColor whiteColor];
	// create the label
	UILabel * headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 17, 214, 20)];
	headerLabel.backgroundColor = [UIColor clearColor];
	headerLabel.opaque = NO;
	headerLabel.textColor = [UIColor whiteColor];
	headerLabel.highlightedTextColor = [UIColor whiteColor];
	headerLabel.font = [UIFont fontWithName:@"Georgia" size:16];
    headerLabel.text = @"Foo是的发牢骚开始的风景啊是打发士大夫";
    
    UILabel * detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 41, 214, 10 )];
	detailLabel.backgroundColor = [UIColor clearColor];
	detailLabel.opaque = NO;
	detailLabel.textColor = [UIColor whiteColor];
	detailLabel.highlightedTextColor = [UIColor whiteColor];
	detailLabel.font = [UIFont fontWithName:@"Georgia" size:12];
    detailLabel.text = @"Fdddoo撒发生地方阿萨德发送到发";
    
    // package and return
    [headerView addSubview:imageView];
    [headerView addSubview:headerLabel];
    [headerView addSubview:detailLabel];

    [customSectionView addSubview:headerView];
    
    [imageView release];
    [headerLabel release];
    [detailLabel release];
    [headerView release];
    
    
    return [customSectionView autorelease];
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 83;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    BOOL isFound = [dataModel checkInCellTable:indexPath];
    if (isFound)
    {
        
        NSArray* arr = [dataModel removeCells:indexPath];
        [tableView deleteRowsAtIndexPaths:arr withRowAnimation:UITableViewRowAnimationTop];
    }
    else
    {
         NSArray* arr = [dataModel insertCells:indexPath];
        [tableView insertRowsAtIndexPaths:arr withRowAnimation:UITableViewRowAnimationBottom];
    }
    /*
    NSArray* arr = [dataModel didObjectAtIndexPath:indexPath];
    BOOL isExpand = YES;
    if(isExpand)
    {
        [tableView insertRowsAtIndexPaths:arr withRowAnimation:UITableViewRowAnimationLeft];
    }
    else
    {
        [tableView deleteRowsAtIndexPaths:arr withRowAnimation:UITableViewRowAnimationRight];
    }
     */
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //here cannot call cellForRowAtIndexPath will cause recure
    //UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    
     if([dataModel levelAtIndexPath:indexPath])
     {
         return  50;
     }
     else{
         return 70;
     }
}

@end
