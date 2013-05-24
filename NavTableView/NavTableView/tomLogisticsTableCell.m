//
//  tomLogisticsTableCell.m
//  NavTableView
//
//  Created by Tommy on 13-5-21.
//  Copyright (c) 2013年 Tommy. All rights reserved.
//

#import "tomLogisticsTableCell.h"
@interface CustomLogisticsCellView:UIView
{
    UIImageView * imageView;
    UILabel *     textLabel;
    UILabel *     detailTextLabel;
    
    NSString *    text;
    NSString *    detailText;
    NSString *    imageName;
}


@property(nonatomic,retain) NSString *text;
@property(nonatomic,retain) NSString *detailText;
@property(nonatomic,retain) NSString *imageName;

+ (float) calcHeight:(NSString * )text;



@end



@interface CustomLogisticsCellView()
{
    
    BOOL isFirst;
#define DefaultImageWidth   26.5
#define DefaultImagePointX  15
//#define DefaultImagePointY()
    
#define ImageSep            8
    
#define LabelToTop          20
#define LabelToBottom       10
#define LabelToRight        15
#define LabelPointX         (DefaultImagePointX + DefaultImageWidth + ImageSep)
#define LabelPointY         LabelToTop
    
#define LabelWidth          (608/2 - LabelToRight - LabelPointX) //(_width)  (_width - LabelToRight - LabelPointX)     
#define LabelSep            10
    
#define DetailLabelPointX  LabelPointX
#define DetailLabelWidth   LabelWidth
#define DetailLabelHeight  10
    
#define LabelHeight (LabelToTop + LabelToBottom + DetailLabelHeight + LabelSep)
}

- (void) setIsFirst:(BOOL) first;
- (BOOL) getIsFirset;

@end

@implementation CustomLogisticsCellView
//static UILabel *  s_calcLabel;
static UIFont *theFont;

@synthesize text,detailText,imageName;

- (id) initWithFrame:(CGRect)frame
{
    //NSLog(@"frame:(%f,%f)",frame.size.width,frame.size.height);

    if(self = [super initWithFrame:frame])
    {
        
        
    }
    
    return  self;
}

- (void) setIsFirst:(BOOL) first
{
    if(isFirst != first)
    {
        [self setNeedsDisplay];
        isFirst = first;
    }
    
}
- (BOOL) getIsFirset
{
    return  isFirst;
}




- (void) drawRect:(CGRect)rect
{
    static float     DefaultLabelFontSize = 13;
    static float     DefaultDetailLableFontSize = 10;
    
    UIImage * image = [UIImage imageNamed:imageName];
    float y = (rect.size.height - image.size.height/2)/2;
    CGRect rectImage = CGRectMake(15,y,image.size.width/2,image.size.height/2);
    
    //[image drawInRect:rectImage];
    
    imageView = [[UIImageView alloc] initWithFrame:rectImage];
    imageView.image = image;
    imageView.opaque = YES;

    
   
    //
    //configure text label
    //
    textLabel = [[UILabel alloc] initWithFrame:CGRectMake(LabelPointX,LabelPointY,LabelWidth,[CustomLogisticsCellView calcHeight:self.text] - LabelHeight)];
    
     //NSLog(@"default:%@",textLabel.font.fontName);
    
    textLabel.backgroundColor = [UIColor clearColor];//[UIColor redColor];
	textLabel.opaque = NO;
	textLabel.textColor = [[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.9] colorWithAlphaComponent:0.9];
	textLabel.highlightedTextColor = [UIColor whiteColor];
    textLabel.font = [UIFont fontWithName:[textLabel.font fontName] size:DefaultLabelFontSize];    
    textLabel.text = text;
    //textLabel.lineBreakMode = UILineBreakModeWordWrap;
    textLabel.numberOfLines = 0;
    

    //
    //configure detail text label
    //
    detailTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(DetailLabelPointX,textLabel.frame.size.height + LabelToTop + 10 , textLabel.frame.size.width,DetailLabelHeight)];
    
    detailTextLabel.backgroundColor = [UIColor clearColor];
	detailTextLabel.opaque = NO;
	detailTextLabel.textColor = [[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.4] colorWithAlphaComponent:0.4];//[UIColor whiteColor];
	detailTextLabel.highlightedTextColor = [UIColor whiteColor];
	detailTextLabel.font = [UIFont fontWithName:[detailTextLabel.font fontName] size:DefaultDetailLableFontSize];
    //[textLabel.font fontWithSize:DefaultDetailLableFontSize];
    detailTextLabel.text = detailText;
    
    
    [self addSubview:imageView];
    [self addSubview:textLabel];
    [self addSubview:detailTextLabel];
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    //draw line 
    UIColor* color = [[UIColor colorWithRed:0.843 green:0.843 blue:0.843 alpha:0.3] colorWithAlphaComponent:0.3];
    CGContextSetStrokeColorWithColor(context, color.CGColor);

    
    float pointX = (imageName == nil)?DefaultImageWidth: (imageView.frame.origin.x + imageView.bounds.size.width/2);
    float pointY = isFirst?rect.size.height/2:0;
    CGContextSetLineWidth(context, 1.0);
    CGContextMoveToPoint(context, pointX,pointY); //start at this point
    CGContextAddLineToPoint(context, pointX, rect.size.height); //draw to this point
    CGContextStrokePath(context);
    
    //draw separator line
    UIColor* sepLineColor = [[UIColor colorWithRed:1 green:1 blue:1 alpha:0.1] colorWithAlphaComponent:0.1];

    
    CGContextSetStrokeColorWithColor(context, sepLineColor.CGColor);
    CGContextSetLineWidth(context, 1.0);
    CGContextMoveToPoint(context, 0, rect.size.height - 1); //start at this point
    CGContextAddLineToPoint(context, rect.size.width, rect.size.height); //draw to this point
    CGContextStrokePath(context);

    
}

+ (float) calcHeight:(NSString * )text
{
    if(theFont == nil)
    {
        theFont = [UIFont fontWithName:@"Georgia" size:13];
    }

    
    CGSize maxSize = CGSizeMake(LabelWidth, CGFLOAT_MAX);
    CGSize textSize = [text sizeWithFont:theFont
                                 constrainedToSize:maxSize];
    
    return textSize.height + LabelHeight;
}






@end




@interface tomLogisticsTableCell()
{
    CustomLogisticsCellView* cView;
}



@end


@implementation tomLogisticsTableCell

- (void) setHeight:(float) newHeight
{
    height = newHeight;
    //cView.frame.size.height = newHeight;
    //change view frame
    
    //CGRect rectView = self.contentView.frame;
    //rectView.size.height = newHeight;
    
    //[self.contentView setFrame:rectView];
    
    //[cView setNeedsDisplay];
}
- (float) getHeight
{
    return height;
}
- (void) setImageName:(NSString*) newImageName
{
    cView.imageName = newImageName;
 //   [cView setNeedsDisplay];
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        [self.textLabel setHidden:YES];
        [cView removeFromSuperview];
        
        cView = [[CustomLogisticsCellView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, [self getHeight])];
        cView.backgroundColor = [[UIColor colorWithRed:0 green:0 blue:0 alpha:0.50] colorWithAlphaComponent:0.5];
        
        [self.contentView addSubview:cView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:NO animated:animated];
}


- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier forHeight:(float)newHeight
{
    [self setHeight:newHeight];
    return [self initWithStyle:style reuseIdentifier:reuseIdentifier];
}

+ (float) calcHeight:(NSString * )text
{
    return [CustomLogisticsCellView calcHeight:text];
}

- (void) setLabelText:(NSString *) text detailText:(NSString *)detailText imageName:(NSString * )imageName
{
    cView.text = text;
    cView.detailText = detailText;
    cView.imageName = imageName;
 //   [cView setNeedsDisplay];
}
- (void) setIsFirst:(BOOL) first
{
    isFirst = first;
    [cView setIsFirst:first];
}
- (BOOL) getIsFirset
{
    return [cView getIsFirset];
    //return  isFirst;
}

- (void) resetWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier forHeight:(float)newHeight
{
    
    [self setHeight:newHeight];
    [self.textLabel setHidden:YES];
    [cView removeFromSuperview];
    [cView release];
    
    cView = [[CustomLogisticsCellView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, [self getHeight])];
    cView.backgroundColor = [[UIColor colorWithRed:0 green:0 blue:0 alpha:0.50] colorWithAlphaComponent:0.5];

    [self.contentView addSubview:cView];
}



@end
