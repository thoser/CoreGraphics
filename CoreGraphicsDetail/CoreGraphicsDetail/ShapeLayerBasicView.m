//
//  ShapeLayerBasicView.m
//  CoreGraphicsDetail
//
//  Created by LXN on 2018/8/12.
//  Copyright © 2018年 LXN. All rights reserved.
//

#import "ShapeLayerBasicView.h"

@implementation ShapeLayerBasicView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)drawRect:(CGRect)rect{
    CAShapeLayer *layer = [CAShapeLayer layer];
//    layer.frame = CGRectMake(0, 0, 100, 100);
//    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.strokeColor = [UIColor whiteColor].CGColor;
    layer.lineWidth = 20;
//    layer.fillColor = [UIColor orangeColor].CGColor;
    [self.layer addSublayer:layer];
    //用bezierpath 渲染layer才会使strokecolor和 fillcolor生效
//    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 100, 100)];
    //圆
//    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)];
    //设置圆角 单边或者 多边
//    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 100, 100) byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(50, 50)];
    //设置圆角 相当于layer.cornerRadius
//    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 100, 100) cornerRadius:10];
//    layer.path = path.CGPath;
    
    //画线动画
//    UIBezierPath *path1 = [UIBezierPath bezierPath];
//    [path1 moveToPoint:CGPointMake(0, 200)];
//    [path1 addLineToPoint:CGPointMake(50, 200)];
//    [path1 addLineToPoint:CGPointMake(200, 200)];
//
//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
//    animation.duration = 3;
//    animation.fromValue = @(0);
//    animation.toValue = @(1);
//    animation.repeatCount = 0;
//
//    layer.path = path1.CGPath;
//    [layer addAnimation:animation forKey:@"strokeEndAnimation"];
    //圆环动画
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 200, 200)];
    layer.path = path.CGPath;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = 3;
    animation.fromValue = @(0);
    animation.toValue = @(1);
    animation.repeatCount = 100;
    
    [layer addAnimation:animation forKey:@"strokeEndAnimation"];
    
    //123
    
    
    
}
@end
