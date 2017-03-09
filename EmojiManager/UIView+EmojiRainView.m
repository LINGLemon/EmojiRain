//
//  UIView+EmojiRainView.m
//  EmojiRain
//
//  Created by xuanfeng on 16/4/26.
//  Copyright © 2016年 LXF. All rights reserved.
//

#import "UIView+EmojiRainView.h"
#import "UIView+Frame.h"
#import <objc/runtime.h>

@interface UIView ()

@property (nonatomic, copy) NSMutableArray *emojiArr;

@end

@implementation UIView (EmojiRainView)

#pragma mark - <rewrite setter/getter>
-(NSMutableArray *)emojiArr{
    return objc_getAssociatedObject(self, @"emojiArr");
}

-(void)setEmojiArr:(NSMutableArray *)emojiArr{
    objc_setAssociatedObject(self, @"emojiArr", emojiArr, OBJC_ASSOCIATION_COPY);
}


#pragma mark - <EmojiRain Func>
- (void)emojiRainFuncWithEmojiImageName:(NSString *) emojiImageName{
    
    [self removeEmojiCache];
    
    //set some attributes
    CGFloat emojiWidth = 44;
    CGFloat emojiHeight = emojiWidth;
    
    NSInteger emojiNum = 25 + arc4random_uniform(5);
    
    for (int i = 0; i <= emojiNum; i++) {
        
        @autoreleasepool {
            
            //get the x location of the emoji
            CGFloat emojiX = 44;
            emojiX = arc4random_uniform(self.w - emojiWidth);
            
            
            //add emoji control
            UIImageView *emojiImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:emojiImageName]];
            emojiImageView.frame = CGRectMake(emojiX, 0, emojiWidth, emojiHeight);
            [self addSubview:emojiImageView];
            
            
//            [self.superview sendSubviewToBack:emojiImageView];
//            [self.superview sendSubviewToBack:self];
            
            //add to the array
            [self.emojiArr addObject:emojiImageView];
            
            
            CGFloat duration = 1 + arc4random_uniform(2) + arc4random_uniform(10) / 10.00;
            
            //rain start
            [UIView animateWithDuration:duration animations:^{
                
                emojiImageView.y = self.h - 44;
                
            } completion:^(BOOL finished) {
                
                [emojiImageView removeFromSuperview];
                
            }];
            
            
        }
        
    }
    
    
}

- (void)removeEmojiCache{
    
    //remove all
    for (UIImageView *emojiImageView in self.emojiArr) {
        [emojiImageView removeFromSuperview];
    }
    [self.emojiArr removeAllObjects];
    //    self.emojiArr = [NSMutableArray array];
    
    
}



@end
