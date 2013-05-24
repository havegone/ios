//
//  tomTableViewController.m
//  NavTableView
//
//  Created by Tommy on 13-5-21.
//  Copyright (c) 2013年 Tommy. All rights reserved.
//

#import "tomDetailLogisticsTableViewController.h"
#import "tomLogisticsTableCell.h"

#define TestNum 10

@interface tomDetailLogisticsTableViewController ()
{
    //CGRect frame;
}



@end


@implementation tomDetailLogisticsTableViewController
@synthesize superController;

- (void) setFrame:(CGRect)newFrame
{
    frame = newFrame;
}

- (CGRect) getFrame
{
    return frame;
}

- (id) initWithFrame:(CGRect)newFrame
{
    
    [self setFrame:newFrame];
    self = [self initWithNibName:nil bundle:nil];
    
    
    return self;
}

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if(self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
    {
        
    }
    return self;
}


- (void) loadView
{
    UITableView* newTable = [[UITableView alloc] initWithFrame:[self getFrame]];
    
    newTable.dataSource = self;
    newTable.delegate = self;
    newTable.separatorStyle = UITableViewCellSelectionStyleNone;
    newTable.backgroundColor = [UIColor clearColor];
    
    [newTable setAllowsSelection:NO];
    self.view = newTable;
    
}
- (void) viewDidLoad
{
    [super viewDidLoad];
    
}





#pragma mark - Table view data source


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



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView             // Default is 1 if not implemented
{
    return 1;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return TestNum+1;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)r

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString* reuseIdentifier = @"CustomCell";
    CGFloat cellHeight = [self tableView:tableView heightForRowAtIndexPath:indexPath];
    if(indexPath.row == TestNum)
    {
        cellHeight = 300;
    }
    
    tomLogisticsTableCell* cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if(cell == nil)
    {
        
        cell = [[tomLogisticsTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier forHeight:cellHeight];
    }
    else
    {
        [cell resetWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier forHeight:cellHeight];
    }
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell setIsFirst:indexPath.row == 0];
    
    if(indexPath.row == TestNum)
    {
        return cell;
    }
    
    
    
    
    if (indexPath.row % 2 == 0)
    {
       [cell setLabelText:@"s的发生的阿萨德发送到发生的发生的发生地方发生地方" detailText:@"阿斯蒂芬" imageName:@"right_on@2x"];
    }
    else
    {
        [cell setLabelText:@"s的发生的发生地方" detailText:@"阿斯蒂芬" imageName:@"11"];
    }
    

    return cell;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //here cannot call cellForRowAtIndexPath will cause recure
    //UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (indexPath.row % 2 == 0)
    {
        return [tomLogisticsTableCell calcHeight:@"s的发生的阿萨德发送到发生的发生的发生地方发生地方"];
    }
    else
    {
        return [tomLogisticsTableCell calcHeight:@"s的发生的发生地方"]; 
    }
    
    return 114;
}



#pragma mark - Table view delegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}



@end
