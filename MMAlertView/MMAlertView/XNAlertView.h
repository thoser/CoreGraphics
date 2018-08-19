//
//  XNAlertView.h
//  XNAlertView
//
//  Created by LXN on 2018/8/19.
//  Copyright © 2018年 LXN. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface XNAlertView : UIView

@property (nonatomic ,copy) NSString *title;//title 提示或者啥
@property (nonatomic, copy) UIColor *mainColor;//主色调
@property (nonatomic, copy) NSArray *buttonArray;//按钮集合
@property (nonatomic, copy) void (^clickBlock)(NSInteger tag);
- (instancetype)initWithCenterView:(UIView *)view buttonArray:(NSArray *)btnArray;
- (void)show;
@end
