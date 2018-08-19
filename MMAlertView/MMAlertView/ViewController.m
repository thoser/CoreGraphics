//
//  ViewController.m
//  MMAlertView
//
//  Created by LXN on 2018/8/19.
//  Copyright © 2018年 LXN. All rights reserved.
//

#import "ViewController.h"
#import "XNAlertView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width - 80, 100)];
    label.text = @"我的妈呀你是个傻逼吧？";
    XNAlertView *view = [[XNAlertView alloc]initWithCenterView:label buttonArray:@[@"确定",@"取消"]];
    view.mainColor = [UIColor blueColor];
    view.title = @"提示";
    [self.view addSubview:view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
