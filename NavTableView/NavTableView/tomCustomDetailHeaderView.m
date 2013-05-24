//
//  tomCustomDetailHeaderView.m
//  NavTableView
//
//  Created by Tommy on 13-5-21.
//  Copyright (c) 2013年 Tommy. All rights reserved.
//

#import "tomCustomDetailHeaderView.h"

@interface tomCustomDetailHeaderView ()

#define DefaultImagePointX  10
#define DefaultImagePointY  10
#define DefaultImageWidth   50
#define DefaultImageHeight  50
#define ImageSep            10

#define LablePointX        (DefaultImagePointX+DefaultImageWidth+ImageSep)
#define LablePointY        (DefaultImagePointY + 7)


#define LableSep            8
#define LableToRight        15
#define LableWidth(_viewWidth)  (_viewWidth - LablePointX -LableToRight)
#define LableHeight(_viewHeight)  (23)


#define DetaileLabelPointX  LablePointX
#define DetaileLabelPointY(_labelHight)  (LablePointY + _labelHight + LableSep)
#define DetaileLabelToBottom 10

//#define LableToBottom 10
@end


@implementation tomCustomDetailHeaderView

@synthesize imageView,textLabel,detailTextLabel;
@synthesize imageName,text,detailText;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */
- (void)drawRect:(CGRect)rect
{
    // Drawing code
 
    //static NSString * DefaultFontName = @"Georgia";
    static float LabelFontSize = 15;
    static float DetailLabelFontSize = 13;
    
    
    
    UIImage* image = [UIImage imageNamed:imageName];
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(DefaultImagePointX,DefaultImagePointY,DefaultImageWidth,DefaultImageHeight)];
    imageView.backgroundColor = [UIColor whiteColor];
    imageView.image = image;
    
    
    textLabel = [[UILabel alloc] initWithFrame:CGRectMake(LablePointX,LablePointY,LableWidth(rect.size.width),LableHeight(rect.size.height))];
    textLabel.backgroundColor = [UIColor clearColor];
	textLabel.opaque = NO;
	textLabel.textColor = [[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.9] colorWithAlphaComponent:0.9];
	//textLabel.highlightedTextColor = [[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.9] colorWithAlphaComponent:0.9];
    //[textLabel.font  fontWithSize:LabelFontSize];//= [UIFont fontWithName:nil size:LabelFontSize];
    //[textLabel.font fontWithSize:LabelFontSize];
    textLabel.font = [UIFont fontWithName:[textLabel.font fontName] size:LabelFontSize];
    textLabel.text = text;
    
    
    
    
    detailTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(DetaileLabelPointX,DetaileLabelPointY(textLabel.frame.size.height), textLabel.frame.size.width,textLabel.frame.size.height-DetaileLabelToBottom)];
    
    detailTextLabel.backgroundColor = [UIColor clearColor];
	detailTextLabel.opaque = NO;
	detailTextLabel.textColor = [[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.6] colorWithAlphaComponent:0.6];
    //detailTextLabel.highlightedTextColor = [UIColor whiteColor];
	detailTextLabel.font = [UIFont fontWithName:[detailTextLabel.font fontName] size:DetailLabelFontSize];
    //detailTextLabel.font = [UIFont boldSystemFontOfSize:DetailLabelFontSize];
    //[detailTextLabel.font fontWithSize:DetailLabelFontSize];
    detailTextLabel.text = detailText;
   
    
    
    [self addSubview:imageView];
    [self addSubview:textLabel];
    [self addSubview:detailTextLabel];
    
}


@end
