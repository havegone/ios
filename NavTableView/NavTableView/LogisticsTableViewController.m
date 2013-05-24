//
//  tomTableViewController.m
//  NavTableView
//
//  Created by Tommy on 13-5-21.
//  Copyright (c) 2013年 Tommy. All rights reserved.
//

#import "LogisticsTableViewController.h"
#import "tomLogisticsTableCell.h"
#import "LogisticsOrderTableCell.h"
#import "tomDetailLogisticsViewController.h"



#define TestNum 10

@interface LogisticsTableViewController ()
{
    NSInteger lastSelectedIndexPath;
}



@end


@implementation LogisticsTableViewController

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
    lastSelectedIndexPath = -1;
    
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
    
    //[newTable setAllowsSelection:NO];
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
     static NSString* reuseIdentifier = @"OrderCell";
    
    LogisticsOrderTableCell * cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    if(cell == nil)
    {
        cell = [[LogisticsOrderTableCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    else
    {
        [cell resetWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    
    [cell setLableText:@"撒事都烦阿萨德发送到发生地方"];
    [cell setDetailLabelText:@"阿萨德发送zcvzxcvzxcvxzc到发生"];
    [cell setTimeLabelText:@"05/88"];
    [cell setAccessoryImageName:@"allow2icon@2x"];
    //
    switch (indexPath.row%4) {
        case 0:
            [cell setLogisticsState:LogisticsStateSent];
            break;
        case 1:
            [cell setLogisticsState:LogisticsStateTransit];
            break;
        case 2:
            [cell setLogisticsState:LogisticsStateDeliver];
            break;
        case 3:
            [cell setLogisticsState:LogisticsStateConfirm];
            break;
            
        default:
            break;
    };
    
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{    
    return DefaultCellHeight + 10 ;
}



#pragma mark - Table view delegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"select:%d",indexPath.row);
    if(lastSelectedIndexPath != indexPath.row)
    {
        
        UITableViewCell* cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:lastSelectedIndexPath inSection:0]];
        if(cell)
        {
            [cell performSelector:@selector(unselected)];
        }
         
        lastSelectedIndexPath = indexPath.row;
    }
    
    tomDetailLogisticsViewController * view = [[tomDetailLogisticsViewController alloc] initWithNibName:nil bundle:nil];
    [self.superController.navigationController pushViewController:view animated:YES];
}


/*
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
}
*/


@end
