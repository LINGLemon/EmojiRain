//
//  ViewController.m
//  EmojiRain
//
//  Created by xuanfeng on 16/4/26.
//  Copyright © 2016年 LXF. All rights reserved.
//

#import "ViewController.h"
#import "EmojiCell.h"

#define RainImageViewRadius 40.0
#define RainTimeInterval 0.3
#define RainEndTime 5.0
#define RainAnimationTime 3.5
#define RainClearTime (RainEndTime + RainAnimationTime)


@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *emojiCollectionView;

@property (weak, nonatomic) IBOutlet UIView *greenView;

@property (nonatomic, strong) NSArray *emojiImageArray;


@property (nonatomic, strong)NSTimer *startTimer;
@property (nonatomic, strong)NSTimer *endTimer;
@property (nonatomic, strong)NSTimer *clearTimer;

@property (nonatomic, strong)CALayer *moveLayer;
@property (nonatomic, strong)UIView *rainView;

@property (nonatomic, strong)NSString *currentImageName;

@end

@implementation ViewController

#pragma mark -
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [self stopAllRainFunc];
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
    [self stopAllRainFunc];
    
    self.currentImageName = self.emojiImageArray[indexPath.row];
    
    _rainView = [[UIView alloc] initWithFrame:self.greenView.frame];
    _rainView.backgroundColor = [UIColor clearColor];
    _rainView.userInteractionEnabled = NO;
    [self.view addSubview:_rainView];
    [self.view bringSubviewToFront:_rainView];
    
    self.startTimer = [NSTimer scheduledTimerWithTimeInterval:RainTimeInterval target:self selector:@selector(showRain) userInfo:@"" repeats:YES];
    
    self.endTimer = [NSTimer scheduledTimerWithTimeInterval:RainEndTime target:self selector:@selector(endRainFunc) userInfo:@"" repeats:NO];
    
    self.clearTimer = [NSTimer scheduledTimerWithTimeInterval:RainClearTime target:self selector:@selector(clearRainFunc) userInfo:@"" repeats:NO];
    
    [[NSRunLoop currentRunLoop] addTimer:self.startTimer forMode:NSRunLoopCommonModes];
    [[NSRunLoop currentRunLoop] addTimer:self.endTimer forMode:NSRunLoopCommonModes];
    [[NSRunLoop currentRunLoop] addTimer:self.clearTimer forMode:NSRunLoopCommonModes];
    
}

- (void)stopAllRainFunc
{
    [self endRainFunc];
    [self clearRainFunc];
}


- (void)endRainFunc
{
    [self.startTimer invalidate];
    [self.endTimer invalidate];
    self.startTimer = nil;
    self.endTimer = nil;
}

- (void)clearRainFunc
{
    [self.clearTimer invalidate];
    self.clearTimer = nil;
    
//    for (CALayer *layer in self.view.layer.sublayers)
//    {
//        [layer removeAllAnimations];
//    }
    
    [self.moveLayer removeFromSuperlayer];
    self.moveLayer = nil;
    [_rainView removeFromSuperview];
    _rainView = nil;
}

- (void)showRain
{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.currentImageName]];
    imageView.bounds = CGRectMake(0, 0, RainImageViewRadius, RainImageViewRadius);
    
    self.moveLayer = [[CALayer alloc] init];
    self.moveLayer.bounds = imageView.bounds;
    self.moveLayer.anchorPoint = CGPointMake(0, 0);
    self.moveLayer.position = CGPointMake(-RainImageViewRadius, -RainImageViewRadius);
    self.moveLayer.contents = (__bridge id _Nullable)(imageView.image.CGImage);
    
    [_rainView.layer addSublayer:self.moveLayer];
    
    [self addAnimation];
}

- (void)addAnimation
{
    CAKeyframeAnimation *moveAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    moveAnimation.values = @[[NSValue valueWithCGPoint:CGPointMake(arc4random_uniform(320), 10)], [NSValue valueWithCGPoint:CGPointMake(arc4random_uniform(320), 500)]];
    moveAnimation.duration = RainAnimationTime;
    moveAnimation.repeatCount = 1;
    moveAnimation.removedOnCompletion = YES;
    
    moveAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    [self.moveLayer addAnimation:moveAnimation forKey:@"move"];
}


#pragma mark - lazy load
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


@end



























