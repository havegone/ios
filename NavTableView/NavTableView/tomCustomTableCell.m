//
//  tomCustomTableCell.m
//  NavTableView
//
//  Created by Tommy on 13-5-20.
//  Copyright (c) 2013年 Tommy. All rights reserved.
//

#import "tomCustomTableCell.h"

@implementation tomCustomTableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
