//
//  TomTabBarItem.h
//  snstaoban
//
//  Created by Tommy on 13-6-20.
//  Copyright (c) 2013年 Bo Xiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TomTabBarItem : NSObject
@property(nonatomic,retain) NSString * title;
@property(nonatomic,retain) UIImage * normalImage;
@property(nonatomic,retain) UIImage * highlightedImage;


- (void) initWithTitle:(NSString*) aTitle NormalImage:(UIImage*) aNormalImage HighlightedImage:(UIImage*) aSelImage;
- (void) initWithTitle:(NSString*) aTitle Image:(UIImage*) image;
- (void) initWithTitle:(NSString*) aTitle;


@end
