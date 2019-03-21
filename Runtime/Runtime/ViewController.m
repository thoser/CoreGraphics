//
//  ViewController.m
//  Runtime
//
//  Created by LXN on 2019/2/28.
//  Copyright © 2019年 LXN. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
typedef enum{
    XNOptionOne = 1,
    XNOptionTwo = 2,
    XNOptionThree = 4,
    XNOptionFour = 8
} XNOptions;
@interface ViewController ()

@end

@implementation ViewController
- (void)test:(int)age height:(long)height{
    
}
- (void)setOption:(XNOptions)option{
    if (option & XNOptionTwo) {
        NSLog(@"包含了xtwo");
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setOption:XNOptionOne|XNOptionTwo];
    
    [self test:10 height:30.0];
//    NSLog(@"%s",@encode())
    
}


@end
