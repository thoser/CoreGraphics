//
//  XNAlertView.m
//  XNAlertView
//
//  Created by LXN on 2018/8/19.
//  Copyright © 2018年 LXN. All rights reserved.
//

#import "XNAlertView.h"

@interface XNAlertView()
{
    
}
@property (nonatomic ,strong) UIView *bgView;//整个背景
@property (nonatomic ,strong) UIView *centerView;//content
@property (nonatomic ,strong) UILabel *titleLabel;

@end
@implementation XNAlertView
- (instancetype)initWithCenterView:(UIView *)view buttonArray:(NSArray *)btnArray{
    if (self = [super init]) {
        self.frame =[UIScreen mainScreen].bounds;
        _mainColor = [UIColor blueColor];
        self.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.6];
        self.centerView = view;
        _buttonArray = [NSArray arrayWithArray:btnArray];
        [self configUI];
    }return self;
}
- (void)configUI{
    self.bgView = [[UIView alloc]init];
    self.bgView.backgroundColor = [UIColor whiteColor];
    self.bgView.layer.cornerRadius = 6;
    [self addSubview:_bgView];
    
    CGRect frame = self.frame;
    frame.size = CGSizeMake(self.frame.size.width - 60, 50 + self.centerView.frame.size.height + (self.buttonArray.count > 0?60:0));
    _bgView.frame = frame;
    _bgView.center = self.center;
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, _bgView.frame.size.width, 50)];
    _titleLabel.textColor = _mainColor;
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.font = [UIFont systemFontOfSize:18];
    [self.bgView addSubview:_titleLabel];
    
    [self.bgView addSubview:_centerView];
    CGRect rect = _centerView.frame;
    rect.origin.x = 10;
    rect.origin.y = 60;
    _centerView.frame = rect;
    if (_buttonArray.count == 0) {
        return;
    }
    CGFloat margin = 10.f;
    CGFloat width = (self.bgView.frame.size.width - margin * (_buttonArray.count + 1))/_buttonArray.count;
    for (NSInteger i = 0; i < _buttonArray.count; i++) {
        UIButton *btn = [[UIButton alloc]init];
        [self.bgView addSubview:btn];
        btn.frame = CGRectMake(margin + (width + margin) * i, _bgView.frame.size.height - 45, width, 40);
        [btn setTitleColor:[UIColor darkGrayColor]  forState:UIControlStateNormal];
        [btn setTitle:_buttonArray[i] forState:UIControlStateNormal];
        btn.layer.cornerRadius = 5;
        btn.backgroundColor = [UIColor whiteColor];
        btn.layer.borderColor = _mainColor.CGColor;
        btn.layer.borderWidth = 0.5;
        if (i == 0) {
            btn.backgroundColor = _mainColor;
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 100+i;
    }
    //123456
    
}
- (void)btnClick:(UIButton *)btn{
    if (self.clickBlock) {
        self.clickBlock(btn.tag);
    }
    [self dismiss];
    
}
- (void)setTitle:(NSString *)title{
    _titleLabel.text = title;
}

- (void)show{
    [[[[UIApplication sharedApplication]windows]firstObject]addSubview:self];
}
- (void)dismiss{
    [self removeFromSuperview];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
