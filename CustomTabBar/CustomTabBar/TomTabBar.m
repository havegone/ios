//
//  TomTabBar.m
//  snstaoban
//
//  Created by Tommy on 13-6-20.
//  Copyright (c) 2013年 Bo Xiu. All rights reserved.
//

#import "TomTabBar.h"
#import "TomTabBarItem.h"
#import "TabBarItemView.h"

#define tomTabBarHeight 50




@interface TomTabBar()
{
    NSInteger _selectedIndex;
    NSInteger _currentSelectedIndex;
    NSMutableArray * _itemViews;
    
    BOOL _isTopBar;
    
    /*
    BOOL _drawImage;
    BOOL _drawTitle;
    BOOL _showSeparationBetweenItems;
    BOOL _showSelectedItem;
    UIColor * _foregroundColor;
    UIColor * _backgroundColor;
    UIColor * _separatorColor;
    UIColor * _selectionGradientColor;
     */
    
    
    int _lastIndex;
}


- (void) reset;

@end

@implementation TomTabBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initTabBar];
        //self.backgroundColor=[UIColor clearColor];
    
    }
    return self;
}

- (void) initTabBar
{
    _delegate = nil;
    _itemViews = [[NSMutableArray alloc]init];
    //_tabBarItems = [[NSMutableArray alloc] init];
    _isTopBar = NO;

    _drawImage = YES;
    _drawTitle = YES;
    _showSeparationBetweenItems = YES;
    _showSelectedItem = YES;
    _foregroundColor = [UIColor whiteColor];
    _separatorColor =[UIColor whiteColor];
    _backgroundColor = [UIColor blackColor];
    _selectionGradientColor = [UIColor whiteColor];
    _lastIndex= -1;
    _selectedIndex = -1;
    

    //[self setOpaque:NO];
    //self.showCurrentSelected = YES;
    //self.currentSelectionIndicatorColor = [UIColor whiteColor];

}

- (void) dealloc
{
    _delegate = nil;
}

- (void) reset
{
    for (UIView* view in _itemViews) {
        [view removeFromSuperview];
    }
    
    [_itemViews removeAllObjects];
}




+ (NSInteger) tabBarHeight
{
    return tomTabBarHeight;
}

- (void) setTabBarItems:(NSArray*) items
{
    _tabBarItems = items;
    [self setNeedsDisplay];
}

- (BOOL)isOpaque
{
    return NO;
}

#pragma mark  override draw
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    //UIGraphicsBeginImageContextWithOptions(

    
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    
    
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddRect(path, NULL, CGRectMake(0, 0, self.frame.size.width, self.frame.size.height));
    CGContextAddPath(currentContext, path);
    
    [_backgroundColor setFill];
    CGContextDrawPath(currentContext, kCGPathFill);    
    CGPathRelease(path);
   
    
    ///*
    
    ///*
    NSInteger count = [_tabBarItems count];
    if(count)
    {
        float itemWidth = self.frame.size.width /count;
        float itemHeight = self.frame.size.height;
        int index = 0;
        int minCount = MIN([_itemViews count], [_tabBarItems count]);
        
        //update items
        for (index = 0; index < minCount ; ++index) {
            TabBarItemView * view = [_itemViews objectAtIndex:index];
            TomTabBarItem* anItem = [_tabBarItems objectAtIndex:index];
            
            view.label.text = anItem.title;
            [view.imageView setHighlightedImage:anItem.highlightedImage];
            [view.imageView setImage: anItem.normalImage];
            
        }
        if([_itemViews count] < [_tabBarItems count])
        {
            //create left items
            for (; index < [_tabBarItems count]; index++) {
                
                TomTabBarItem* anItem = [_tabBarItems objectAtIndex:index];
                TabBarItemView * itemView = [TabBarItemView tabBarItemView:self withFrame:CGRectMake(itemWidth*index, 0, itemWidth, itemHeight) withTomTabBarItem:anItem];
                [_itemViews addObject:itemView];
                [self addSubview:itemView];
                
            }
            
        }
        else
        {
            int tmpIndex =index;
            for (; tmpIndex < [_tabBarItems count]; tmpIndex++)
            {
                TabBarItemView * view = [_itemViews objectAtIndex:index];
                [view removeFromSuperview];
            }
            
            [_itemViews removeObjectsInRange:NSMakeRange(index,[_tabBarItems count] - index)];
            
        }
    }
    
    

   
    if(_selectedIndex > -1 && _showSelectedItem)
    {  _lastIndex = _currentSelectedIndex;
        float itemWidth = self.frame.size.width / [_tabBarItems count];
        float xPoint = _selectedIndex * itemWidth + itemWidth/2;
        
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        
        UIColor* startColor = _selectionGradientColor;
        CGFloat* startColorComponents = (CGFloat*)CGColorGetComponents([startColor CGColor]);
        
        UIColor* endColor = _backgroundColor;
        CGFloat* endColorComponents = (CGFloat*)CGColorGetComponents([endColor CGColor]);
        
        CGFloat components[12] = {
            startColorComponents[0],
            startColorComponents[1],
            startColorComponents[2],
            startColorComponents[3],
            

            endColorComponents[0],
            endColorComponents[1],
            endColorComponents[2],
            endColorComponents[3],
            
            
            endColorComponents[0],
            endColorComponents[1],
            endColorComponents[2],
            0.0
        };
        
        CGFloat locations[3] = {
            0.0f, 0.3f,1.0f
        };
        
    
        CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace,(const CGFloat*) &components,(const CGFloat*) &locations, sizeof(locations)/sizeof(locations[0]));
        
        CGColorSpaceRelease(colorSpace);
        
        float centerOfRadial = (_isTopBar) ? 0.0f : self.frame.size.height;
        
        CGContextDrawRadialGradient(currentContext, gradient, CGPointMake(xPoint, centerOfRadial), 0.0f, CGPointMake(xPoint, centerOfRadial), itemWidth/4.0f, kCGGradientDrawsAfterEndLocation|kCGGradientDrawsBeforeStartLocation);
        
        CGGradientRelease(gradient);
        
    }
     
   
    
    if(_showSeparationBetweenItems) {
        float itemWidth = self.frame.size.width / [_tabBarItems count];
        for(int i = 1; i < [_tabBarItems count]; i++) {
            [_separatorColor set];
            CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 0.1f);
            CGContextMoveToPoint(UIGraphicsGetCurrentContext(), itemWidth*(float)i, 0);
            CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), itemWidth*(float)i, self.frame.size.height);
            CGContextStrokePath(UIGraphicsGetCurrentContext());
        }
    }
   
    
    //*/
    
    //
    
    
}

#pragma mark TabBarItemViewDelegate
- (void) didCreationTabBarItemView:(TabBarItemView *) itemView withTomTabBarItem:(TomTabBarItem *) anItem
{
    float itemWidth = itemView.frame.size.width;
    float itemHeight = itemView.frame.size.height;
    
    if(_isTopBar) {
        itemView.imageView.frame = CGRectMake(10, 5, itemWidth-20, itemHeight/10*5 -5);
        itemView.label.frame = CGRectMake(10, 5 + itemHeight/10*5, itemWidth-20, itemHeight/10*5 - 15);
    } else {
        itemView.imageView.frame = CGRectMake(10, 10, itemWidth-20, itemHeight/10*5 -5);
        itemView.label.frame = CGRectMake(10, 5 + itemHeight/10*5, itemWidth-20, itemHeight/10*5 - 5);
    }
    
    itemView.label.textColor = _foregroundColor;
    
}

#pragma mark touch delegate

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if([touches count] == 1)
    {
        UITouch* aTouch = [[touches allObjects] objectAtIndex:0];
        float itemWidth = self.frame.size.width /[self.tabBarItems count];
        CGPoint touchPoint = [aTouch locationInView:self];
        NSInteger itemTouched = touchPoint.x /itemWidth;

        _selectedIndex = itemTouched;
        _currentSelectedIndex = _selectedIndex;
        [self setNeedsDisplay];
    }
    
    
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    _selectedIndex = -1;
    
    [self setNeedsDisplay];
    if([self.delegate respondsToSelector:@selector(tabBar:selectedItemWithIndex:)]) {
        [self.delegate tabBar:self selectedItemWithIndex:_currentSelectedIndex];
    }
    
    
    
}

- (void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

@end
