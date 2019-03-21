//
//  ViewController.m
//  Runloop-线程保活
//
//  Created by LXN on 2019/3/7.
//  Copyright © 2019年 LXN. All rights reserved.
//

#import "ViewController.h"
#import "XNThread.h"
#import "XNDefaultThread.h"
@interface ViewController ()
//@property (nonatomic, strong)XNThread *thread;
@property (nonatomic, strong)XNDefaultThread *thread;
//@property (nonatomic, assign) BOOL xnStop;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.thread = [[XNDefaultThread alloc]init];
//    self.xnStop = NO;
//    __weak typeof(self) weakself = self;
//    self.thread = [[XNThread alloc]initWithBlock:^{
//        NSLog(@"begin -----%@----",[NSThread currentThread]);
//        [[NSRunLoop currentRunLoop]addPort:[[NSPort alloc]init] forMode:NSDefaultRunLoopMode];
//        while (weakself && !weakself.xnStop) {
//            //如果不给当前runloop添加observer/sources/timer等 就会自动销毁
//            [[NSRunLoop currentRunLoop]runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
//        }
//        NSLog(@"end -----%@----",[NSThread currentThread]);
//    }];
//    [self.thread start];


}
- (IBAction)stop:(id)sender {
    [self.thread stop];
//    //waitUntilDone 设置成yes 表示子线程执行完毕 才会继续往下走
//    if (!self.thread) return;
//    [self performSelector:@selector(stopCurrentThread) onThread:self.thread withObject:nil waitUntilDone:YES];
}
//- (void)stopCurrentThread{
//    self.xnStop = YES;
//    CFRunLoopStop(CFRunLoopGetCurrent());
//    self.thread = nil;
//}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.thread excuteTask:^{
       NSLog(@"%s %@",__func__,[NSThread currentThread]);
    }];
//    //这种方法会对viewcontroller产生一个强引用
////    self.thread = [[XNThread alloc]initWithTarget:self selector:@selector(run) object:nil];
////    [thread start];
//    if (!self.thread) return;
//    [self performSelector:@selector(run) onThread:self.thread withObject:nil waitUntilDone:NO];
    
}

- (void)run{
    
//    NSLog(@"%s %@",__func__,[NSThread currentThread]);
}
- (void)dealloc{
    NSLog(@"%s %@",__func__,[NSThread currentThread]);
//    [self stop:nil];
}

@end
