//
//  XNBaseDemo.m
//  多线程的学习
//
//  Created by LXN on 2019/3/13.
//  Copyright © 2019年 LXN. All rights reserved.
//

#import "XNBaseDemo.h"
#import <libkern/OSAtomic.h>
#import <os/lock.h>
@interface XNBaseDemo()
@property (nonatomic,assign)NSInteger tickets;

@property (nonatomic,assign)OSSpinLock lock;
@property (nonatomic,assign)os_unfair_lock lock1;
@end
@implementation XNBaseDemo
-(instancetype)init{
    if (self = [super init]) {
        _tickets = 30;
        _lock = OS_SPINLOCK_INIT;
        _lock1 = OS_UNFAIR_LOCK_INIT;
        [self ticketsTest];
    }return self;
}
- (void)ticketsTest{
    dispatch_queue_t queue = dispatch_queue_create("myqueue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        for (NSInteger i =0; i<10; i++) {
            [self ticketTest];
        }
    });
    dispatch_async(queue, ^{
        for (NSInteger i =0; i<10; i++) {
            [self ticketTest];
        }
    });
    dispatch_async(queue, ^{
        for (NSInteger i =0; i<10; i++) {
            [self ticketTest];
        }
    });
    
}
- (void)ticketTest{
    
    
//        OSSpinLockLock(&_lock);
    os_unfair_lock_lock(&_lock1);
            
            NSInteger ticket = _tickets;
            ticket--;
            _tickets = ticket;
            NSLog(@"还剩%ld张票 %@",ticket,[NSThread currentThread]);
      
//         OSSpinLockUnlock(&_lock);
    os_unfair_lock_unlock(&_lock1);
    
}
@end

