//
//  ViewController.m
//  runloopObserver
//
//  Created by LXN on 2019/3/7.
//  Copyright © 2019年 LXN. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
void observerRunloop(CFRunLoopObserverRef ref ,CFRunLoopActivity activity,void *info) {
    switch (activity) {
        case kCFRunLoopEntry:
            NSLog(@"kCFRunLoopEntry");//进入
            break;
        case kCFRunLoopExit:
            NSLog(@"kCFRunLoopExit");//退出
            break;
            
        default:
            break;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //两种创建observer的方法
//    CFRunLoopObserverRef observerRef = CFRunLoopObserverCreate(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0,observerRunloop , NULL);
//    CFRunLoopAddObserver(CFRunLoopGetMain(), observerRef, kCFRunLoopCommonModes);
//    CFRelease(observerRef);
    //第二种
    CFRunLoopObserverRef observerRef =  CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        switch (activity) {
            case kCFRunLoopEntry:
                NSLog(@"kCFRunLoopEntry");//进入
                break;
            case kCFRunLoopExit:
                NSLog(@"kCFRunLoopExit");//退出
                break;
            case kCFRunLoopAfterWaiting:
                NSLog(@"kCFRunLoopAfterWaiting");//唤醒
                break;
            case kCFRunLoopBeforeWaiting:
                NSLog(@"kCFRunLoopBeforeWaiting");//休眠
                break;
            default:
                break;
        }
    });
    CFRunLoopAddObserver(CFRunLoopGetMain(), observerRef, kCFRunLoopCommonModes);
    CFRelease(observerRef);
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

@end
