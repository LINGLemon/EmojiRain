//
//  EmojiCell.m
//  EmojiRain
//
//  Created by xuanfeng on 16/4/26.
//  Copyright © 2016年 LXF. All rights reserved.
//

#import "EmojiCell.h"

@interface EmojiCell ()

@property (weak, nonatomic) IBOutlet UIImageView *emojiImageView;

@end

@implementation EmojiCell

-(void)setEmojiImageName:(NSString *)emojiImageName{
    
    _emojiImageName = emojiImageName;
    
    self.emojiImageView.image = [UIImage imageNamed:emojiImageName];
    
}

@end
