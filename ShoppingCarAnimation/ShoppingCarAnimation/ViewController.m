//
//  ViewController.m
//  ShoppingCarAnimation
//
//  Created by 杜可春 on 2018/9/10.
//  Copyright © 2018年 杜可春. All rights reserved.
//

#import "ViewController.h"
#import "ShoppingCarView.h"
@interface ViewController ()

/** 加入购物车按钮 */
@property (nonatomic, strong) UIButton *addButton;
/** 购物车按钮 */
@property (nonatomic, strong) UIButton *shoppingCartButton;
/** 商品数量label */
@property (nonatomic, strong) UILabel *goodsNumLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // UI搭建
    [self setUpUI];
}


- (void)setUpUI {
    // 加入购物车按钮
    self.addButton = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 120, self.view.frame.size.height - 50, 120, 50)];
    [self.view addSubview:self.addButton];
    self.addButton.backgroundColor = [UIColor redColor];
    [self.addButton setTitle:@"加入购物车" forState:UIControlStateNormal];
    [self.addButton addTarget:self action:@selector(addButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    // 购物车按钮
    self.shoppingCartButton = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 120 - 50 - 20, self.addButton.frame.origin.y, 50, 50)];
    [self.view addSubview:self.shoppingCartButton];
    [self.shoppingCartButton setImage:[UIImage imageNamed:@"cart"] forState:UIControlStateNormal];
    [self.shoppingCartButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    // 商品数量label
    self.goodsNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.shoppingCartButton.center.x, self.shoppingCartButton.frame.origin.y, 30, 15)];
    [self.view addSubview:self.goodsNumLabel];
    self.goodsNumLabel.backgroundColor = [UIColor redColor];
    self.goodsNumLabel.textColor = [UIColor whiteColor];
    self.goodsNumLabel.textAlignment = NSTextAlignmentCenter;
    self.goodsNumLabel.font = [UIFont systemFontOfSize:10];
    self.goodsNumLabel.layer.cornerRadius = 7;
    self.goodsNumLabel.clipsToBounds = YES;
    self.goodsNumLabel.text = @"99+";
}
- (void)addButtonClicked:(UIButton *)sender {
    [ShoppingCarView addShoppingCarWithGoodsImage:[UIImage imageNamed:@"cart"] startPoint:self.addButton.center endPoint:self.shoppingCartButton.center completion:^(BOOL finish) {
        CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        scaleAnimation.fromValue = @1.0;
        scaleAnimation.toValue = @0.7;
        scaleAnimation.repeatCount = 2;
        scaleAnimation.duration = 0.1;
        scaleAnimation.removedOnCompletion = NO;
        scaleAnimation.autoreverses = YES;//动画结束时 执行逆向动画
        
        CABasicAnimation *shake = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        shake.fromValue = @(-0.1);
        shake.toValue = @0.1;
        shake.repeatCount = 2;
        shake.duration = 0.1;
        shake.autoreverses = YES;
        shake.removedOnCompletion = NO;
        
        [self.goodsNumLabel.layer addAnimation:scaleAnimation forKey:nil];
        [self.shoppingCartButton.layer addAnimation:shake forKey:nil];
        
        
    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
