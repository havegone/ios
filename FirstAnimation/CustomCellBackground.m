//
//  CustomCellBackground.m
//  FirstAnimation
//
//  Created by Tommy on 13-6-3.
//  Copyright (c) 2013年 Tommy. All rights reserved.
//

#import "CustomCellBackground.h"
#import "Common.h"

@implementation CustomCellBackground

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
 -(void) drawRect: (CGRect) rect
 {
     /*
 CGContextRef context = UIGraphicsGetCurrentContext();
 
 UIColor * redColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];
 
 CGContextSetFillColorWithColor(context, redColor.CGColor);
 CGContextFillRect(context, self.bounds);
     
     */
     /*
     
     CGContextRef context = UIGraphicsGetCurrentContext();
     
     UIColor * whiteColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
     UIColor * lightGrayColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0];
     
     CGRect paperRect = self.bounds;
     
     drawLinearGradient(context, paperRect, whiteColor.CGColor, lightGrayColor.CGColor);
     
     
     
     */
     
     /*
     
     CGContextRef context = UIGraphicsGetCurrentContext();
     
     UIColor * whiteColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
     UIColor * lightGrayColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0];
     UIColor * redColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0]; // NEW
     
     CGRect paperRect = self.bounds;
     
     drawLinearGradient(context, paperRect, whiteColor.CGColor, lightGrayColor.CGColor);
     
     // START NEW
     CGRect strokeRect = CGRectInset(paperRect, 5.0, 5.0);
     CGContextSetStrokeColorWithColor(context, redColor.CGColor);
     CGContextSetLineWidth(context, 1.0);
     CGContextStrokeRect(context, strokeRect);
     // END NEW
     
     */
     
     CGContextRef context = UIGraphicsGetCurrentContext();
     
     UIColor * whiteColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
     UIColor * lightGrayColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0];
     
    // UIColor * lightGrayColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0]; // Previous Code
     UIColor * separatorColor = [UIColor colorWithRed:255.0/255.0 green:208.0/255.0 blue:208.0/255.0 alpha:1.0];
     
     // UIColor * redColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];
     
     CGRect paperRect = self.bounds;
     
     drawLinearGradient(context, paperRect, whiteColor.CGColor, lightGrayColor.CGColor);
     
     CGPoint startPoint = CGPointMake(paperRect.origin.x, paperRect.origin.y + paperRect.size.height - 1);
     CGPoint endPoint = CGPointMake(paperRect.origin.x + paperRect.size.width - 1, paperRect.origin.y + paperRect.size.height - 1);
     draw1PxStroke(context, startPoint, endPoint, separatorColor.CGColor);
     
     // START NEW
     CGRect strokeRect = paperRect;
     strokeRect.size.height -= 1;
     strokeRect = rectFor1PxStroke(strokeRect);
     CGContextSetStrokeColorWithColor(context, whiteColor.CGColor);
     // END NEW
     
     CGContextSetLineWidth(context, 1.0);
     CGContextStrokeRect(context, strokeRect);
      
 }

@end
