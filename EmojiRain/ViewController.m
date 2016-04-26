//
//  ViewController.m
//  EmojiRain
//
//  Created by xuanfeng on 16/4/26.
//  Copyright © 2016年 LXF. All rights reserved.
//

#import "ViewController.h"
#import "EmojiCell.h"
#import "UIView+EmojiRainView.h"


@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *emojiCollectionView;

@property (weak, nonatomic) IBOutlet UIView *rainView;

@property (nonatomic, strong) NSArray *emojiImageArray;

@end

@implementation ViewController

#pragma mark - <lazy load>
-(NSArray *)emojiImageArray{
    
    _emojiImageArray = @[
                         @"emo_001.png",
                         @"emo_002.png",
                         @"emo_003.png",
                         @"emo_004.png",
                         @"emo_005.png",
                         @"emo_006.png",
                         @"emo_007.png",
                         @"emo_008.png",
                         @"emo_009.png",
                         @"emo_010.png",
                         @"emo_011.png",
                         @"emo_012.png",
                         @"emo_013.png",
                         @"emo_014.png",
                         @"emo_015.png",
                         @"emo_016.png",
                         @"emo_017.png",
                         @"emo_018.png",
                         @"emo_019.png",
                         @"emo_020.png",
                         @"emo_021.png",
                         @"emo_022.png",
                         @"emo_023.png",
                         @"emo_024.png",
                         @"emo_025.png",
                         @"emo_026.png",
                         @"emo_027.png",
                         @"emo_028.png"
                         ];
    
    return _emojiImageArray;
}


#pragma mark -
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}

#pragma mark - <UICollectionView DataSource>
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.emojiImageArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    EmojiCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"EmojiCell" forIndexPath:indexPath];
    
    cell.emojiImageName = self.emojiImageArray[indexPath.row];
    
    return cell;
    
}


#pragma mark - <UICollectionView Delegate>
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //start rain...
    //or you can write imagename as @"emo_0XX", XX from 01 to 28
    [self.rainView emojiRainFuncWithEmojiImageName:self.emojiImageArray[indexPath.row]];
    
}




@end



























