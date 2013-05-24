//
//  tomLogisticsOrderTableCell.m
//  NavTableView
//
//  Created by Tommy on 13-5-22.
//  Copyright (c) 2013年 Tommy. All rights reserved.
//

#import "LogisticsOrderTableCell.h"



@interface CustomOrderCellView : UIView
{
    UIImageView *   picImage;
    UIImageView *   picNewImage;
    UILabel     *   textLabel;
    UILabel     *   timeLabel;
    UILabel     *   detailLabel;
    UIImageView *   btnImage;
    UILabel     *   stateLabels[LogisticsStateCount];
    UIImageView *   stateImages[LogisticsStateCount];
    
    
    
    LogisticsOrderTableCell* cell;
    
    
    BOOL          hiddenNewImage;
    
    NSString *    picImageName;
    NSString *    text;
    NSString *    timeText;
    NSString *    detailText;
    NSString *    btnImageName;
    NSString *    stateLabelTexts[LogisticsStateCount];
    NSMutableArray *    imageNames;
}


@property(nonatomic,retain) NSString * picImageName;
@property(nonatomic,retain) NSString * text;
@property(nonatomic,retain) NSString * timeText;
@property(nonatomic,retain) NSString * detailText;
@property(nonatomic,retain) NSString * btnImageName;


- (void) configViews:(CGRect)rect;
- (void) updateState:(LogisticsState)newState;


- (BOOL) getHiddenNewImage;
- (void) setHiddenNewImage:(BOOL)hidden;
@end




@implementation CustomOrderCellView
@synthesize picImageName,text,timeText,detailText,btnImageName;

- (id) initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        [self setHiddenNewImage:YES];
        imageNames = [[NSMutableArray alloc] initWithObjects:@"icon1_off@2x",@"icon2_off@2x",@"icon3_off@2x",@"icon4_off@2x" ,nil];
        //[self resetState];
        
        stateLabelTexts[LogisticsStateSent] = @"已发货";
        stateLabelTexts[LogisticsStateTransit] = @"运输中";
        stateLabelTexts[LogisticsStateDeliver] = @"派件中";
        stateLabelTexts[LogisticsStateConfirm] = @"已确认";
    }
    
    return self;
}

- (void) updateState:(LogisticsState)newState
{
    [imageNames replaceObjectAtIndex:newState withObject:[NSString stringWithFormat:@"icon%d_on@2x",newState + 1]];
}


- (BOOL) getHiddenNewImage
{
    return hiddenNewImage;
}
- (void) setHiddenNewImage:(BOOL)hidden
{
    hiddenNewImage = hidden;
}


- (void) dealloc
{
    [imageNames release];
    [super dealloc];
}
- (void) configViews:(CGRect)rect
{
    
//pic image view frame
#define DefaultPicImagePointX 10
#define DefaultPicImagePointY DefaultPicImagePointX
#define DefaultPicImageWidth  50
#define DefaultPicImageHeight 50
    
//new image view frame
#define DefaultPicNewImageWidth   13
#define DefaultPicNewImageHeight  13
#define DefaultPicNewImagePointX  (DefaultPicImageWidth - DefaultPicNewImageWidth)
#define DefaultPicNewImagePointY  (DefaultPicImageHeight - DefaultPicNewImageHeight)
    

//text label frame

#define ImageSep          10
#define TextLabelPointX   (DefaultPicImagePointX + DefaultPicImageWidth + ImageSep)
#define TextLabelPointY   (DefaultPicImagePointY + 6)
#define TextLabelWidth    100
#define TextLabelHeight   20

#define TimeLabelToRight  10
#define TimeLabelWidth    30

    
    
    
    picImage = [[UIImageView alloc] initWithFrame:CGRectMake(DefaultPicImagePointX, DefaultPicImagePointY, DefaultPicImageWidth, DefaultPicImageHeight)];
    picImage.backgroundColor =[UIColor whiteColor];
    picImage.image = [UIImage imageNamed:picImageName];
    
 
    
    picNewImage = [[UIImageView alloc] initWithFrame:CGRectMake(DefaultPicNewImagePointX, DefaultPicNewImagePointY, DefaultPicNewImageWidth, DefaultPicNewImageWidth)];
    picNewImage.image = [UIImage imageNamed:@"sgin@2x"];
    picNewImage.backgroundColor =[UIColor clearColor];
    //picNewImage.backgroundColor = [UIColor redColor];
    [picNewImage setHidden:[self getHiddenNewImage]];

    
    [picImage addSubview:picNewImage];
    
    
    float textLabelWidth = rect.size.width - (TimeLabelWidth + TimeLabelToRight + 10) - TextLabelPointX;
    
    
        
    textLabel = [[UILabel alloc] initWithFrame:CGRectMake(TextLabelPointX, TextLabelPointY, textLabelWidth, TextLabelHeight)];
    textLabel.textColor = [[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.9] colorWithAlphaComponent:0.9];
    textLabel.font = [UIFont fontWithName:textLabel.font.fontName size:16];
    textLabel.backgroundColor = [UIColor clearColor];
    textLabel.text = text;
    
    
    
    
    float timePointX = (TextLabelPointX + textLabel.frame.size.width + 10);
    
    
    
    timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(timePointX, TextLabelPointY, TimeLabelWidth, TextLabelHeight)];
    timeLabel.textColor = [[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.4] colorWithAlphaComponent:0.4];
    timeLabel.font = [UIFont fontWithName:timeLabel.font.fontName size:11];
    timeLabel.backgroundColor = [UIColor clearColor];
    timeLabel.text = timeText;
    
    
    float detailLabelPointY = TextLabelPointY + TextLabelHeight ;
    detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(TextLabelPointX, detailLabelPointY, textLabelWidth, TextLabelHeight)];
    detailLabel.textColor = [[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.6] colorWithAlphaComponent:0.6];
    detailLabel.font = [UIFont fontWithName:detailLabel.font.fontName size:13];
    detailLabel.backgroundColor = [UIColor clearColor];
    detailLabel.text = detailText;
    
    
    float stateImagePointX = TextLabelPointX;
    float stateImagePointY = DefaultPicImagePointY + DefaultPicImageHeight;
    float stateImageWidth = 25;
    float stateImageHeight = 25;
    
    float stateSep = 25 + stateImageWidth;
    float stateLabelPointY = stateImagePointY + stateImageHeight + 5;
    float stateLabelWidth = stateImageWidth + 5;
    float stateLabelPointX = stateImagePointX + (stateImageWidth - stateLabelWidth)/2;
    float stateLabelHegiht = 10;

    
    
    for (int i = LogisticsStateSent; i < LogisticsStateCount; ++i) {
        
        stateImages[i] = [[UIImageView alloc] initWithFrame:CGRectMake(stateImagePointX + i * stateSep,stateImagePointY,stateImageWidth,stateImageHeight)];
        stateImages[i].image = [UIImage imageNamed:[imageNames objectAtIndex:i]];
        
        
        stateLabels[i] = [[UILabel alloc] initWithFrame:CGRectMake(stateLabelPointX + i * stateSep, stateLabelPointY, stateLabelWidth, stateLabelHegiht)];
        stateLabels[i].font = [UIFont fontWithName:[stateLabels[i].font fontName] size:10];
        stateLabels[i].backgroundColor = [UIColor clearColor];
        stateLabels[i].textColor = [[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.3] colorWithAlphaComponent:0.3];
        
        
        stateLabels[i].text = stateLabelTexts[i];
        
        

        [self addSubview:stateImages[i]];
        [self addSubview:stateLabels[i]];

    }
    
    
    //arrow icon

    float btnImageWidth = 8;
    float btnImageHeight = 16;
    float btnImagePointY = (rect.size.height-btnImageHeight)/2;
    float btnImagePointX = (rect.size.width - 15 - btnImageWidth);
    btnImage = [[UIImageView alloc] initWithFrame:CGRectMake(btnImagePointX, btnImagePointY, btnImageWidth, btnImageHeight)];
    UIImage* tmpImage = [UIImage imageNamed:btnImageName];
    btnImage.image = tmpImage;
    btnImage.backgroundColor = [UIColor clearColor];
    
    
    
    
     //draw line
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIColor* color = [[UIColor colorWithRed:0.843 green:0.843 blue:0.843 alpha:0.3] colorWithAlphaComponent:0.3];
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    
    
    float pointX = stateImagePointX + stateImageWidth/2;
    float pointY = stateImagePointY + stateImageHeight/2;
    CGContextSetLineWidth(context, 1.0);
    CGContextMoveToPoint(context, pointX,pointY); //start at this point
    
    pointX = stateImages[LogisticsStateConfirm].frame.origin.x + stateImageWidth/2;
    
    CGContextAddLineToPoint(context, pointX, pointY); //draw to this point
    CGContextStrokePath(context);
    
    
    
    [self addSubview:btnImage];
    
    [self addSubview:picImage];
    [self addSubview:textLabel];
    [self addSubview:timeLabel];
    [self addSubview:detailLabel];
    
    //UIView * selectedView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 114)];
    //selectedView.backgroundColor = [[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.1] colorWithAlphaComponent:0.1];
    //[self addSubview:selectedView];
    
  /*
    if(cell.selected)
    {
        [self addSubview:cell.selectedBackgroundView];
    }
    else
    {
        if(cell.selectedBackgroundView.superview == self)
        {
            [cell.selectedBackgroundView removeFromSuperview];
        }
    }
    
    */
}

- (void) drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    [self configViews:rect];
}

@end

@interface LogisticsOrderTableCell()
{
    CustomOrderCellView * cView;
    UIView * selectedView ;
    

}

@property (nonatomic,retain) CustomOrderCellView * cView;


@end

static int s_LastTouchCell = -1;
@implementation LogisticsOrderTableCell

@synthesize cView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        [self.textLabel setHidden:YES];
        [cView removeFromSuperview];
        
        cView = [[CustomOrderCellView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 114)];
        cView.backgroundColor = [[UIColor colorWithRed:0 green:0 blue:0 alpha:0.50] colorWithAlphaComponent:0.5];

        [self.contentView addSubview:cView];
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    //[super drawRect:rect];
    
    cView.frame = CGRectMake(0, 0, self.frame.size.width, DefaultCellHeight);
    
    if(self.selectedBackgroundView.superview == self)
    {
        [self.selectedBackgroundView removeFromSuperview];
    }
    self.selectedBackgroundView.frame = CGRectMake(0, 0, self.frame.size.width, DefaultCellHeight);

}

- (void) setLableText:(NSString*)text
{
    cView.text = text;
}
- (void) setDetailLabelText:(NSString*)text
{
    cView.detailText = text;
}
- (void) setTimeLabelText:(NSString*)text
{
    cView.timeText = text;
}
- (void) setImageName:(NSString*)name
{
    cView.picImageName = name;
}
- (void) setAccessoryImageName:(NSString*)name
{
    cView.btnImageName = name;
}

- (void) setHiddenNewImage:(BOOL) hidden
{
    [cView setHiddenNewImage:hidden];
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



- (LogisticsState) getLogisticsState
{
    return logisticsState;
}

- (void) setLogisticsState:(LogisticsState)newState
{
    logisticsState = newState;
    [cView updateState:newState];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{ 
    //NSSet *allTouches = [event allTouches];
    
    
   // [self ]
    //NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    
    //id tableView = [self.superview class];
    
    //NSLog(@"dddd:%@",tableView);
    
    if([self.superview respondsToSelector:@selector(indexPathForCell:)])
    {
        NSIndexPath * indexPath = [self.superview performSelector:@selector(indexPathForCell:) withObject:self];
        if(s_LastTouchCell != indexPath.row)
        {
            
            SEL selCellForRowAtIndexPath = @selector(cellForRowAtIndexPath:);
            UITableViewCell* cell = [self.superview performSelector:selCellForRowAtIndexPath withObject:[NSIndexPath indexPathForRow:s_LastTouchCell inSection:0]];
            if(cell)
            {
                [cell performSelector:@selector(unselected)];
            }
            
            s_LastTouchCell = indexPath.row;
        }
        //NSLog(@"index :%@",indexPath);
        
    }
    
    if([[event allTouches] count] == 1)
    {
        //只是相应单点触控
        UITouch *touch = [touches anyObject];
        UIView * currentView = [touch view];
        
        if (CGRectContainsRect(self.cView.frame,currentView.frame)) {
            //是否在cView之内
            
            //NSLog(@"touch in cview");
            //是否为点击事件
            if(selectedView==nil)
            {
                selectedView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, DefaultCellHeight)];
                selectedView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.6];            }
            
            if (selectedView.superview != self.cView) {
                [selectedView removeFromSuperview];
                

                [cView addSubview:selectedView];
            }
            
            [super touchesBegan:touches withEvent:event];
        }
        
        
    }
    
    
}

/*

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touch move");
    [super touchesMoved:touches withEvent:event];
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touch end");
    [super touchesEnded:touches withEvent:event];
}

*/

/*

- (void)didAddSubview:(UIView *)subview
{
    if (subview == self.selectedBackgroundView)
    {
        if(self.selectedBackgroundView.superview == self)
        {
            //NSLog(@"asdfas%f,%f",self.selectedBackgroundView.frame.size.width,self.selectedBackgroundView.frame.size.height);
            //[self setNeedsDisplay];
            //self.selectedBackgroundView.frame = self.cView.frame;
            //[self.selectedBackgroundView removeFromSuperview];
        }
        NSLog(@"catch ");
    }
    else
    {
        [super didAddSubview:subview];
    }
}
*/


- (void) resetWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    [cView removeFromSuperview];
    [cView release];
    
    cView = [[CustomOrderCellView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, DefaultCellHeight)];
    cView.backgroundColor = [[UIColor colorWithRed:0 green:0 blue:0 alpha:0.50] colorWithAlphaComponent:0.5];
    
    
    cView.text = @"撒事都烦阿萨德发送到发生地方";
    cView.detailText = @"阿萨德发送zcvzxcvzxcvxzc到发生";
    cView.timeText = @"05/88";
    cView.btnImageName = @"allow2icon@2x";
    
    [self.contentView addSubview:cView];
}


- (void) unselected
{
    if(selectedView)
    {
        [selectedView removeFromSuperview];
    }
}




@end
