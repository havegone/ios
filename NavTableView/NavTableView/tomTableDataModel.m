//
//  tomTableDataModel.m
//  NavTableView
//
//  Created by Tommy on 13-5-17.
//  Copyright (c) 2013年 Tommy. All rights reserved.
//

#import "tomTableDataModel.h"

@interface tomTableDataModel()

- (void) initData;



@end


@implementation tomTableDataModel

@synthesize dataSource,cellTable;


- (id) init
{
    
    if(self = [super init])
    {
        
    }
    
    [self initData];
    
    return  self;
}

- (void) initData
{

    //dataSource
    dataSource = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"]];
    
   // cellTable = [[NSMutableArray alloc] initWithCapacity:10];
    
    cellTable = [[NSMutableArray alloc] initWithArray:dataSource];
    
}


- (NSUInteger) sectionCount
{
 //   many section is more complex
 //   return [self.dataSource count];
    
   return  1;
}
- (NSUInteger) rowCount: (NSUInteger)section
{
    //return [[[self.dataSource objectAtIndex:section] valueForKey:@"states"] count] + 1;
     NSLog(@"count:%d",[self.cellTable count]);
    return  [self.cellTable count];
}
- (id) objectAtIndexPath:(NSIndexPath*) indexPath
{
    
    NSUInteger section = indexPath.section;
    NSUInteger row = indexPath.row;
    

   NSString* desc =  [[self.cellTable objectAtIndex:row] valueForKey:@"desc"];
    
   NSLog(@"%@",desc);
    
    return  desc;
    
}

- (NSUInteger) levelAtIndexPath:(NSIndexPath*) indexPath
{
    NSUInteger row = indexPath.row;
      
    NSInteger level =  [[[self.cellTable objectAtIndex:row] valueForKey:@"level"] intValue];

    
    return  level;
}
- (NSArray*) didObjectAtIndexPath:(NSIndexPath*) indexPath
{    
    BOOL isFound = [self checkInCellTable:indexPath];
    
    if(isFound)
    {
        return [self removeCells:indexPath];
    }
    else
    {
        return [self insertCells:indexPath];
    }
    
}


- (NSArray*) insertCells:(NSIndexPath*) indexPath
{
    NSMutableArray * tempArray = [[NSMutableArray alloc] initWithCapacity:3];
    
    NSArray* dic = [[self.cellTable objectAtIndex:indexPath.row] valueForKey:@"states"];
    
    //NSLog(@"%@",self.cellTable);
    
    

    //NSLog(@"%@",dic);
    NSInteger row = indexPath.row;
    for (id obj in dic)
    {
        ++row;
        [self.cellTable insertObject:obj atIndex:row];
        [tempArray addObject:[NSIndexPath indexPathForRow:row inSection:indexPath.section]];
    }
    
    NSLog(@"count:%d",[self.cellTable count]);
    
    
    return tempArray;
    
}

- (NSArray*) removeCells:(NSIndexPath*) indexPath
{
    NSMutableArray * tempArray = [[NSMutableArray alloc] initWithCapacity:3];

    
    NSArray* dic = [[self.cellTable objectAtIndex:indexPath.row] valueForKey:@"states"];
    
    NSInteger row = indexPath.row;
    for (id obj in dic)
    {
        ++row;
        [self.cellTable removeObjectIdenticalTo:obj];
        [tempArray addObject:[NSIndexPath indexPathForRow:row inSection:indexPath.section]];
    }
    
    NSLog(@"count:%d",[self.cellTable count]);
    
    return tempArray;
}


- (BOOL) checkInCellTable:(NSIndexPath *)indexPath
{
    NSArray* dic = [[self.cellTable objectAtIndex:indexPath.row] valueForKey:@"states"];
    
    for (id obj in dic)
    {
        NSInteger index=[self.cellTable indexOfObjectIdenticalTo:obj];
        if(index>0 && index!=NSNotFound)
            return YES;
    }
    
    return NO;
}








@end
