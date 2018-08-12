//
//  ViewController.m
//  CoreGraphicsDetail
//
//  Created by LXN on 2018/8/8.
//  Copyright © 2018年 LXN. All rights reserved.
//

#import "ViewController.h"
#import "CoreGraphicsView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CoreGraphicsView *view = [[CoreGraphicsView alloc]initWithFrame:CGRectMake(0, 100, 400, 500)];
    [self.view addSubview:view];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
