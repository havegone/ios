//
//  tomTableDataModel.h
//  NavTableView
//
//  Created by Tommy on 13-5-17.
//  Copyright (c) 2013年 Tommy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface tomTableDataModel : NSObject
{
    
    NSArray * dataSource;
    
    NSMutableArray * cellTable;
}

@property(retain,nonatomic) NSArray * dataSource;
@property(retain,nonatomic) NSMutableArray * cellTable;


- (id) init;


- (NSUInteger) sectionCount;
- (NSUInteger) rowCount: (NSUInteger)section;
- (id) objectAtIndexPath:(NSIndexPath*) indexPath;
- (NSUInteger) levelAtIndexPath:(NSIndexPath*) indexPath;
- (NSArray*) didObjectAtIndexPath:(NSIndexPath*) indexPath;

- (NSArray*) insertCells:(NSIndexPath*) indexPath;

- (NSArray*) removeCells:(NSIndexPath*) indexPath;

- (BOOL) checkInCellTable:(NSIndexPath *)indexPath;






@end
