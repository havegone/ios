//
//  tomLogisticsOrderTableCell.h
//  NavTableView
//
//  Created by Tommy on 13-5-22.
//  Copyright (c) 2013年 Tommy. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum _LogisticsState
{
    LogisticsStateUnsent = -1, //未发货
    LogisticsStateSent = 0,      //已发货
    LogisticsStateTransit,   //运输中
    LogisticsStateDeliver,   //派件中
    //LogisticsStateReceipt,   //已签收
    LogisticsStateConfirm,   //已确认
    LogisticsStateCount
    
} LogisticsState;

@interface LogisticsOrderTableCell : UITableViewCell
{
    LogisticsState logisticsState;
}


- (LogisticsState) getLogisticsState;
- (void) setLogisticsState:(LogisticsState)newState;

- (void) resetWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
- (void) unselected;

- (void) setLableText:(NSString*)text;
- (void) setDetailLabelText:(NSString*)text;
- (void) setTimeLabelText:(NSString*)text;
- (void) setImageName:(NSString*)name;
- (void) setAccessoryImageName:(NSString*)name;
- (void) setHiddenNewImage:(BOOL) hidden;


#define DefaultCellHeight 114


@end
