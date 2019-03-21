//
//  XNDefaultThread.m
//  Runloop-线程保活
//
//  Created by LXN on 2019/3/8.
//  Copyright © 2019年 LXN. All rights reserved.
//

#import "XNDefaultThread.h"
#import "XNThread.h"
@interface XNDefaultThread()
@property (nonatomic, strong) XNThread *thread;
@end
@implementation XNDefaultThread
#pragma mark 公共方法
- (instancetype)init{
    if (self = [super init]) {
        
        self.thread = [[XNThread alloc]initWithBlock:^{
            //初始化一下
            NSLog(@"start");
            CFRunLoopSourceContext context = {0};
            CFRunLoopSourceRef source = CFRunLoopSourceCreate(kCFAllocatorDefault, 0, &context);
            CFRunLoopAddSource(CFRunLoopGetCurrent(), source, kCFRunLoopDefaultMode);
            //用C语言 returnAfterSourceHandled 是否执行完就退出 No就不用写ewhile循环了
            CFRelease(source);
            CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0e10, false);
            NSLog(@"end");
        }];
        [self.thread start];
        
        
    }return self;
}
- (void)run{
    [self.thread start];
}
- (void)stop{
    if (!self.thread) return;
    [self performSelector:@selector(__stop) onThread:self.thread withObject:nil waitUntilDone:YES];
}
- (void)excuteTask:(XNThreadBlock)task{
    if (!self.thread || !task) return;
    
    [self performSelector:@selector(__excuteTask:) onThread:self.thread withObject:task waitUntilDone:NO];
}
- (void)dealloc{
    NSLog(@"%s",__func__);
    [self stop];
}
#pragma mark 私有方法
- (void)__excuteTask:(XNThreadBlock)task{
    task();
}
- (void)__stop{
    CFRunLoopStop(CFRunLoopGetCurrent());
    self.thread = nil;
}
@end
