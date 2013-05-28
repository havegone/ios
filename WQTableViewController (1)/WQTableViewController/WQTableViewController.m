//
//  WQTableViewController.m
//  lazyTableUpdate
//
//  Created by Bob Wu on 12-5-9.
//  Copyright (c) 2012年 veex. All rights reserved.
//


#import "WQTableViewController.h"

@implementation WQTableViewController


//load cell's image

- (void)loadCellImage
{
    NSArray *indexPathsForLoad = [wqTable indexPathsForVisibleRows];
    for (NSIndexPath *item in indexPathsForLoad) {
        NSInteger rowNumberForCell = item.row;
        NSString *imageStr = [[tableDataArray objectAtIndex:rowNumberForCell] valueForKey:KimageKey];
        NSString *imageName = [[[tableDataArray objectAtIndex:rowNumberForCell] valueForKey:KidKey]stringByAppendingString:@".temp"];
        
                
        NSString *imageDataPath = [NSHomeDirectory() stringByAppendingPathComponent:[@"Library/Caches/" stringByAppendingString:imageName]];
        
        if (![[NSFileManager defaultManager] fileExistsAtPath:imageDataPath]) {
            
            NSURL *imageUrl = [NSURL URLWithString:[imageStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
            NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
            [imageData writeToFile:imageDataPath atomically:YES];
            UIImage *image = [UIImage imageWithData:imageData];
            [delegate cellImageDidLoad:item image:image];
            
        }
    }
}

#pragma mark - Table View delegate
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!tableView.isDragging && !tableView.isDecelerating)
    {
        [self performSelectorInBackground:@selector(loadCellImage) withObject:nil];
    }
}

#pragma mark - Scroll View delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self performSelectorInBackground:@selector(loadCellImage) withObject:nil];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (!decelerate) {
        [self performSelectorInBackground:@selector(loadCellImage) withObject:nil];
    }
}

@end
