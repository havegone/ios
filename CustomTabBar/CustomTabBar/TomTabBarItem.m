//
//  TomTabBarItem.m
//  snstaoban
//
//  Created by Tommy on 13-6-20.
//  Copyright (c) 2013年 Bo Xiu. All rights reserved.
//

#import "TomTabBarItem.h"

@implementation TomTabBarItem



- (void) initWithTitle:(NSString* ) aTitle NormalImage:(UIImage*) aNormalImage HighlightedImage:(UIImage*) aSelImage
{
    _highlightedImage = aSelImage;
    _normalImage = aNormalImage;
    _title = aTitle;
}
- (void) initWithTitle:(NSString*) aTitle Image:(UIImage*) image
{
    [self initWithTitle:aTitle NormalImage:image HighlightedImage:image];
}
- (void) initWithTitle:(NSString*) aTitle
{
    [self initWithTitle:aTitle NormalImage:nil HighlightedImage:nil];
}

@end
