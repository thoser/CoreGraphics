//
//  ViewController.m
//  Runloop-timer
//
//  Created by LXN on 2019/3/7.
//  Copyright © 2019年 LXN. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    static int count = 0;
    //滑动的时候timer是不执行的
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        NSLog(@"%d",++count);
    }];
    //NSRunLoopCommonModes s是一个标记 在commMode中数组放着两种模式 表示该timer可以再这两种模式下工作
    [[NSRunLoop mainRunLoop]addTimer:timer forMode:NSRunLoopCommonModes];
//    [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        NSLog(@"%d",++count);
//    }];

}


@end
