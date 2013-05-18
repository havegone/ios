//
//  tomTablePlainViewController.m
//  NavTableView
//
//  Created by Tommy on 13-5-17.
//  Copyright (c) 2013年 Tommy. All rights reserved.
//

#import "tomTablePlainViewController.h"

@interface tomTablePlainViewController ()

@end

@implementation tomTablePlainViewController

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
    
    [self initNavBar];
    
    [self initNavToolBar];

   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initNavBar
{
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self.navigationController.navigationBar setHidden:NO];
    
    // set rightItem
    UIBarButtonItem *rightItem1 = [[UIBarButtonItem alloc] initWithTitle:@"r1" style:UIBarButtonItemStyleBordered target:self action:@selector(popToRootVC)];
    self.navigationItem.rightBarButtonItem = rightItem1;
    
    
    
    UIBarButtonItem *rightItem2 = [[UIBarButtonItem alloc] initWithTitle:@"r2" style:UIBarButtonItemStyleBordered target:self action:@selector(popItemVC)];
    
    self.navigationItem.rightBarButtonItems=@[rightItem1,rightItem2];
    
    [rightItem1 release];
    [rightItem2 release];
    
    /*
     UIBarButtonItem *rightItem3 = [[UIBarButtonItem alloc] initWithTitle:@"r3" style:UIBarButtonItemStyleBordered target:self action:@selector(popToRootVC)];
     
     
     UIBarButtonItem *rightItem4 = [[UIBarButtonItem alloc] initWithTitle:@"r4" style:UIBarButtonItemStyleBordered target:self action:@selector(popToRootVC)];
     
     
     UIBarButtonItem *rightItem5 = [[UIBarButtonItem alloc] initWithTitle:@"r5" style:UIBarButtonItemStyleBordered target:self action:@selector(popToRootVC)];
     
     
     //self.navigationItem.rightBarButtonItems=@[rightItem1,rightItem2,rightItem3,rightItem4,rightItem5];
     
     
     NSLog(@"right items count:%d",[self.navigationItem.rightBarButtonItems count]);
     */
    
    //set left item
    //use left item will cover back button item
    //self.navigationItem.leftBarButtonItems=@[rightItem1,rightItem2,rightItem3,rightItem4,rightItem5];
    
    
    
    //set back button text failed.
    //why cannot operator on back button
    //[self.navigationItem.backBarButtonItem setStyle:UIBarButtonItemStylePlain];
    
    
    //self.navigationItem.backBarButtonItem.title = @"ddddd";
    
    
    
    // when you design a prompt for navigationbar, the hiehgt of navigationbar will becaome 74, ignore the orientation
    
    //[self.navigationItem leftItemsSupplementBackButton:YES];
    
    //set title view
    UIView* titleView = [[UIView alloc] initWithFrame:CGRectMake(0,0,300,70)];//
    titleView.backgroundColor=[UIColor redColor];
    //[titleView setOpaque:YES];
    
    CGRect rectSubLabel = CGRectMake(5, 5, 100, 20);
    
    UILabel * titleSubLabel = [[UILabel alloc] initWithFrame:rectSubLabel];//[titleView frame]];
    titleSubLabel.text = @"sub";
    [titleView addSubview:titleSubLabel];
    self.navigationItem.titleView = titleView;
    [titleView release];
    
    // set prompt text
    self.navigationItem.prompt = @"Hello, im the prompt";
    
    //not effect on it
    self.navigationItem.title=@"dddddd";
    
}
- (void)initNavToolBar
{
    // test ToolBar
    
    UIBarButtonItem *one = [[UIBarButtonItem alloc] initWithTitle:@"r2" style:UIBarButtonItemStyleBordered target:self action:@selector(popItemVC)];
   // UIBarButtonItem *one = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:nil action:nil];
    UIBarButtonItem *two = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:nil action:nil];
    UIBarButtonItem *three = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:nil action:nil];
    UIBarButtonItem *four = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:nil action:nil];
    UIBarButtonItem *flexItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [self setToolbarItems:[NSArray arrayWithObjects:flexItem, one, flexItem, two, flexItem, three, flexItem, four, flexItem, nil]];
    [one release];
    [two release];
    [three release];
    [four release];
    [flexItem release];
    
    [self.navigationController setToolbarHidden:NO];//.toolbarHidden = NO;
    
}

- (void)popToRootVC
{
    NSLog(@"popToRootVC");
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)popItemVC
{
    [self.navigationController popViewControllerAnimated:YES];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    
    return cell;
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
}

@end
