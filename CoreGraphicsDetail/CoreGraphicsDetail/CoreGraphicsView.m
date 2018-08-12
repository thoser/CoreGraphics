//
//  CoreGraphicsView.m
//  CoreGraphicsDetail
//
//  Created by LXN on 2018/8/8.
//  Copyright © 2018年 LXN. All rights reserved.
//

#import "CoreGraphicsView.h"

@implementation CoreGraphicsView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

*/
- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //画线段
//    CGContextMoveToPoint(context, 10.0, 10.0);
//    CGContextAddLineToPoint(context, 50, 10);
//    CGContextAddLineToPoint(context, 100, 30);
//    CGContextSetLineWidth(context, 2);
//    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
//    CGContextStrokePath(context);
//
//    //画虚线
//    CGContextMoveToPoint(context, 20, 20);
//    double lenth[] = {20,10};
//    //CGContextSetLineDash(context, 0, lenth, 2);
//    CGContextAddLineToPoint(context, 100, 100);
//    CGContextSetStrokeColorWithColor(context, [UIColor yellowColor].CGColor);
//    CGContextStrokePath(context);
//
//    //画椭圆
//    CGContextAddEllipseInRect(context, CGRectMake(0, 0, 100, 200));
//    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
//    CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
//    CGContextDrawPath(context, kCGPathFillStroke);
//    CGContextClosePath(context);
////    UIGraphicsGetCurrentContext();
//    // CGContextStrokePath CGContextFillPath CGContextDrawPath
//    /*
//     kCGPathFill,
//     kCGPathEOFill,偶数是 空的
//     kCGPathStroke,
//     kCGPathFillStroke,
//     kCGPathEOFillStroke 奇数填充 偶数
//     */
//    //画圆
//    CGContextAddEllipseInRect(context, CGRectMake(0, 200, 100, 100));
//    CGContextSetFillColorWithColor(context, [UIColor greenColor].CGColor);
//    CGContextFillPath(context);
//
//    //画圆环
//    CGContextSetLineWidth(context, 10);
//    CGContextAddEllipseInRect(context, CGRectMake(100, 100, 100, 100));
//    CGContextSetStrokeColorWithColor(context, [UIColor orangeColor].CGColor);
//    CGContextStrokePath(context);
//    //画矩形
//    CGContextAddRect(context, CGRectMake(100, 200, 100, 100));
//
//    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
//    CGContextSetStrokeColorWithColor(context, [UIColor brownColor].CGColor);
//    CGContextDrawPath(context, kCGPathFillStroke);
    //画圆角矩形 圆角是 10
//    CGFloat radius = 10.f;
//    //第一种方法
//    CGContextSetLineWidth(context, 2.0);
//    CGContextMoveToPoint(context, 55, 300);
//    CGContextAddArcToPoint(context, 0, 200 , radius, 200, 10);
//    CGContextAddArcToPoint(context, 100, 200, 100, 200+radius, 10);
//    CGContextAddArcToPoint(context, 100, 300, 100-radius, 300, 10);
//    CGContextAddArcToPoint(context, 0, 300, 0, 300-radius, 10);
//    CGContextClosePath(context);
//    CGContextStrokePath(context);
    //第二种方法
    //加箭头 气泡框
//    CGContextAddLineToPoint(context, 50, 310);
//    CGContextAddLineToPoint(context, 45, 300);
//    CGContextAddArc(context, radius, 300-radius, radius, M_PI/2, M_PI, 0);
//    CGContextAddArc(context, radius, 200+radius, radius, M_PI, 1.5*M_PI, 0) ;
//    CGContextAddArc(context, 100-radius, 200+radius, radius, 1.5*M_PI, 2*M_PI, 0);
//    CGContextAddArc(context, 100-radius, 300-radius, radius, 0, M_PI/2, 0);
//
//
//
//    CGContextClosePath(context);//收尾相连闭合
//
//    CGContextStrokePath(context);
    
    //绘制弧线
//    CGContextAddArc(context, 300, 300, 100, 0, M_PI/2, 1);
//    [[UIColor whiteColor] set];
//    CGContextDrawPath(context, kCGPathFillStroke);
    //绘制文本内容
//    NSString *str = @"毛毛是个大美女";
//    CGRect rect1 = CGRectMake(100, 100, 100, 100);
//    UIFont *font = [UIFont systemFontOfSize:18];
//    UIColor *color = [UIColor redColor];
//    [str drawInRect:rect1 withAttributes:@{NSFontAttributeName:font,NSParagraphStyleAttributeName:[[NSMutableParagraphStyle alloc]init],NSForegroundColorAttributeName:color}];
    //绘制Image
//    UIImage *image = [UIImage imageNamed:@"登录"];
//    [image drawAtPoint:CGPointMake(0, 0)];
//--------渐变-------
    //线性渐变
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    /*指定渐变色
     space:颜色空间
     components:颜色数组,注意由于指定了RGB颜色空间，那么四个数组元素表示一个颜色（red、green、blue、alpha），
     如果有三个颜色则这个数组有4*3个元素
     locations:颜色所在位置（范围0~1），这个数组的个数不小于components中存放颜色的个数
     count:渐变个数，等于locations的个数
     */
    CGFloat compoents[12]={
        248.0/255.0,86.0/255.0,86.0/255.0,1,
        249.0/255.0,127.0/255.0,127.0/255.0,1,
        1.0,1.0,1.0,1.0
    };
    CGFloat location[3] = {0,0.3,1.0};
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, compoents, location, 3);
    CGContextDrawLinearGradient(context, gradient, CGPointMake(0, 0), CGPointMake(0, 50), kCGGradientDrawsAfterEndLocation);
    CGContextDrawRadialGradient(context, gradient, CGPointMake(200, 200), 0, CGPointMake(200, 200), 100, kCGGradientDrawsBeforeStartLocation);
    CGColorSpaceRelease(colorSpace);
    
    
}
@end
