//
//  EmitterLayer.m
//  MediaPlayer
//
//  Created by LXN on 2018/9/19.
//  Copyright © 2018年 LXN. All rights reserved.
//

#import "EmitterLayer.h"
#define KSCREENW [UIScreen mainScreen].bounds.size.width
#define KSCREENH [UIScreen mainScreen].bounds.size.height
@interface EmitterLayer()
@property (nonatomic, assign)CGPoint touchPoint;
@end
@implementation EmitterLayer

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame withImage:(UIImage *)image{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
//        [self praiseAnimation];
    }return self;
}
- (void)startAnimation:(UIImage *)image{
    CAEmitterLayer *layer = [[CAEmitterLayer alloc]init];
    layer.emitterSize = CGSizeMake(KSCREENW, 0);
    layer.emitterPosition = CGPointMake(KSCREENW/2, 0);
    layer.emitterMode = kCAEmitterLayerOutline;//从发射器边缘发出
    layer.emitterShape = kCAEmitterLayerLine;//线性发出
    [self.layer addSublayer:layer];
    CAEmitterCell *cell = [CAEmitterCell emitterCell];
    cell.birthRate = 2;//粒子产生速度
    cell.lifetime = 50;//粒子存活时间
    cell.velocity = 10;//初始速度
    cell.velocityRange = 5;//初始速度差值区间
    cell.yAcceleration = 2;//y轴及速度
    cell.spin = 1;//粒子旋转速度
    cell.spinRange = 2;//粒子旋转速度范围
    cell.emissionRange = M_PI;//粒子发射角度范围
    cell.contents = (id)[UIImage imageNamed:@"树叶"].CGImage;
    cell.scale = 0.3;//缩放比例
    cell.scaleRange = 0.2;//缩放比列
    cell.alphaSpeed = -0.02;
    layer.emitterCells = @[cell];
    
    
    
}

- (void)stopAnimation{
    
}
- (void)praiseAnimation{
    UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(self.touchPoint.x, self.touchPoint.y, 30, 30)];
    [self addSubview:imageV];
    CGFloat finishX = self.touchPoint.x- round(random()%200);
    CGFloat finishY = self.touchPoint.y-200;
    //  imageView在运动过程中的缩放比例
    CGFloat scale = round(random() % 2) + 0.7;
    // 生成一个作为速度参数的随机数
    CGFloat speed = 1 / round(random() % 900) + 0.6;
    
    NSTimeInterval duration = 4 * speed;
    
    if (duration == INFINITY) duration = 2.412346;
    //  开始动画
    [UIView beginAnimations:nil context:(__bridge void *_Nullable)(imageV)];
    //  设置动画时间
    [UIView setAnimationDuration:duration];
    imageV.frame = CGRectMake(finishX, finishY, 30*scale, 30*scale);
    imageV.image = [UIImage imageNamed:@"树叶"];
    [UIView animateWithDuration:duration animations:^{
        imageV.alpha = 0;
    }];
    [UIView setAnimationDidStopSelector:@selector(onAnimationComplete:finished:context:)];
    [UIView setAnimationDelegate:self];
    [UIView commitAnimations];
    
}

/// 动画完后销毁iamgeView
- (void)onAnimationComplete:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context{
    UIImageView *imageView = (__bridge UIImageView *)(context);
    [imageView removeFromSuperview];
    imageView = nil;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSSet *allTouches = [event allTouches ];
    UITouch *touch = [allTouches anyObject];
    self.touchPoint = [touch locationInView:[touch view]];
    [self praiseAnimation];
    
}
@end
