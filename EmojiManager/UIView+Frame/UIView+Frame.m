//
//  UIView+Frame.m
//  EmojiRain
//
//  Created by xuanfeng on 16/4/26.
//  Copyright © 2016年 LXF. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)


- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    
    frame.origin.x = x;
    
    self.frame = frame;
}


- (CGFloat)x
{
    return self.frame.origin.x;
}



- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    
    frame.origin.y = y;
    
    self.frame = frame;
}


- (CGFloat)y
{
    return self.frame.origin.y;
}



- (void)setW:(CGFloat)w
{
    CGRect frame = self.frame;
    
    frame.size.width = w;
    
    self.frame = frame;
}


- (CGFloat)w
{
    return self.frame.size.width;
}



- (void)setH:(CGFloat)h
{
    CGRect frame = self.frame;
    
    frame.size.height = h;
    
    self.frame = frame;
}


- (CGFloat)h
{
    return self.frame.size.height;
}


@end
