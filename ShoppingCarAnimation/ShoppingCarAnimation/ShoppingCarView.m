//
//  ShoppingCarView.m
//  ShoppingCarAnimation
//
//  Created by 杜可春 on 2018/9/10.
//  Copyright © 2018年 杜可春. All rights reserved.
//

#import "ShoppingCarView.h"

@implementation ShoppingCarView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}

/*
 购物车动画 分为
 1.点击加入购物车的时候 有一张图片从（起始点）呈贝塞尔曲线落入购物车（终止点）
 2.旋转动画
 3.落入购物车的途中 图片不断变小
 4.透明度不断变小
 5.动画完成后 购物车摇晃
 */

+ (void)addShoppingCarWithGoodsImage:(UIImage *)image startPoint:(CGPoint )startPoint endPoint:(CGPoint )endPoint completion:(void(^)(BOOL))completion{
    //创建动画的layer
    CAShapeLayer *layer = [[CAShapeLayer alloc]init];
    layer.contents = (id)image.CGImage;
    layer.frame = CGRectMake(startPoint.x - 20 , startPoint.y - 20 , 40, 40);
    
    //获取顶端的视图控制器 为什么不用keywindow 因为在切换视图的时候会造成动画覆盖在上层
    UIViewController *rootVC = [[UIApplication sharedApplication].delegate window].rootViewController;
    UIViewController *parentVC = rootVC.presentedViewController;
    while (parentVC != nil) {
        rootVC = parentVC;
    }
    while ([rootVC  isKindOfClass:[UINavigationController class]]) {
        rootVC = [(UINavigationController *) rootVC topViewController];
    }
    //layer添加到视图上
    [rootVC.view.layer addSublayer:layer];
    
    //创建贝塞尔曲线 移动轨迹
    UIBezierPath *movePath = [UIBezierPath bezierPath];
    [movePath moveToPoint:startPoint];
    CGPoint point = CGPointMake((startPoint.x+endPoint.x)/2, startPoint.y - 100);
    [movePath addQuadCurveToPoint:endPoint controlPoint:point];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.removedOnCompletion = NO;
    animation.duration = 1.0;
    animation.fillMode = kCAFillModeForwards;
    animation.path = movePath.CGPath;
    
    //创建缩小动画
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    scaleAnimation.fromValue = @1;
    scaleAnimation.toValue = @0.5;
    scaleAnimation.duration = 1.0f;
    scaleAnimation.removedOnCompletion = NO;
    scaleAnimation.fillMode = kCAFillModeForwards;
    scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];//动画效果 淡入淡出
    [layer addAnimation:scaleAnimation forKey:nil];
    [layer addAnimation:animation forKey:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [layer removeFromSuperlayer];
        completion(YES);
    });
    
    
    
}

@end
