//
//  StartViewController.m
//  ShanHaiJing-Trip
//
//  Created by mac on 2018/8/16.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "StartViewController.h"
#import "FishModelImageView.h"

@interface StartViewController ()
@property(nonatomic, strong)UIImageView * bgView;
@property(nonatomic, strong)FishModelImageView * fishModelView;
@property(nonatomic, assign) CGPoint fingerPoint; //手指移动位置
@end

@implementation StartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self ininGameMilieu];
}
#pragma mark - 初始化环境
-(void)ininGameMilieu{
    self.bgView =[[UIImageView alloc]initWithFrame:self.view.bounds];
    self.bgView.image =[UIImage imageNamed:@"bg"];
    self.bgView.userInteractionEnabled = YES;
    [self.view addSubview:self.bgView];
    [self initFishView];
}

#pragma mark - 初始化鱼类
- (void)initFishView{
    self.fishModelView =[[FishModelImageView alloc]initModelFishWithType:FishModelImageViewTypeXHY andDirection:FishModelImageViewFromLeft];
    [self.bgView addSubview:self.fishModelView];
    
}

#pragma mark - 触摸事件
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    //当前的point
    CGPoint currentP = [touch locationInView:self.view];
    //以前的point
    CGPoint preP = [touch previousLocationInView:self.view];
    //x轴偏移的量
    CGFloat offsetX = currentP.x - preP.x;
    //Y轴偏移的量
    CGFloat offsetY = currentP.y - preP.y;
    

    //1.让鱼跟着手势移动
    [UIView animateWithDuration:.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
         self.fishModelView.center =CGPointMake(self.fishModelView.center.x +offsetX, self.fishModelView.center.y+offsetY);
        [self.fishModelView makeRotation:self.fishModelView speedX:offsetX speedY:offsetY];
        
       
    } completion:^(BOOL finished) {
        
    }];
}

-(void)sizeChangeAnimation{
    //关键帧动画 改变大小
    CAKeyframeAnimation * anim =[CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    anim.values = @[@1.5,@.8,@1,@1.2,@1];
    anim.duration = .6;
    [self.fishModelView.layer addAnimation:anim forKey:nil];
}

//绘制鱼的运动曲线
/*
 CurrentP 当前point
 */
-(void)setPathWithView:(UIView *)view andCurrentP:(CGPoint)currentP  andX:(CGFloat)x andY:(CGFloat)y{


    NSLog(@"%f",x);
}

@end
