//
//  tomLogisticsTableCell.h
//  NavTableView
//
//  Created by Tommy on 13-5-21.
//  Copyright (c) 2013年 Tommy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tomLogisticsTableCell : UITableViewCell
{
    float height;
    BOOL  isFirst;
}


+ (float) calcHeight:(NSString * )text;



- (void) setIsFirst:(BOOL) first;
- (BOOL) getIsFirset;

- (void) setHeight:(float) newHeight;
- (float) getHeight;
- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier forHeight:(float)height;
- (void) setLabelText:(NSString *) text detailText:(NSString *)detailText imageName:(NSString * )imageName;
- (void) setImageName:(NSString*) newImageName;

- (void) resetWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier forHeight:(float)height;



@end
