//
//  ViewController.m
//  GCDTest
//
//  Created by LXN on 2018/9/14.
//  Copyright © 2018年 LXN. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    dispatch_semaphore_t semaphore;
    NSInteger ticket;
    NSLock *lock;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    ticket = 50;
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    dispatch_queue_t queue = dispatch_queue_create("并行", DISPATCH_QUEUE_CONCURRENT);//任务并不具备顺序
//    dispatch_async(queue, ^{//async 异步 开启新的线程
//        NSLog(@"第一个任务%@",[NSThread currentThread]);
//    });
//    dispatch_async(queue, ^{
//        NSLog(@"第二个任务%@",[NSThread currentThread]);
//    });
//    dispatch_async(queue, ^{
//        NSLog(@"第三个任务%@",[NSThread currentThread]);
//    });
//
//    dispatch_queue_t queue1 = dispatch_queue_create("串行", DISPATCH_QUEUE_SERIAL);//任务执行按照顺序来
//    dispatch_async(queue1, ^{//async 异步 开启新的线程
//        NSLog(@"第1个任务%@",[NSThread currentThread]);
//    });
//    dispatch_async(queue1, ^{
//        NSLog(@"第2个任务%@",[NSThread currentThread]);
//    });
//    dispatch_async(queue1, ^{
//        NSLog(@"第3个任务%@",[NSThread currentThread]);
//    });
    
//    dispatch_sync(queue1, ^{
//        NSLog(@"第4个任务%@",[NSThread currentThread]);
//    });
//    dispatch_sync(queue1, ^{
//        NSLog(@"第5个任务%@",[NSThread currentThread]);
//    });
//    dispatch_sync(queue1, ^{
//        NSLog(@"第6个任务%@",[NSThread currentThread]);
//    });
//    //一次执行
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//
//    });
//
    
    /*这里是一个GCD的两个站点的买票任务*/
    /*GCD*/
//    semaphore = dispatch_semaphore_create(1);
//    dispatch_queue_t queue = dispatch_queue_create("北京", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_queue_t queue1 = dispatch_queue_create("上海", DISPATCH_QUEUE_CONCURRENT);
    __weak typeof(self) weakself = self;
//    dispatch_async(queue, ^{
//        [weakself soldTicket];
//    });
//    dispatch_async(queue1, ^{
//        [weakself soldTicket];
//    });
    /*NSThread*/
//    lock = [[NSLock alloc]init];
//    NSThread *thread1 = [[NSThread alloc]initWithTarget:self selector:@selector(soldTicket) object:nil];
//    [thread1 start];
//    //直接启动
//    NSThread *thread2 = [[NSThread alloc]initWithTarget:self selector:@selector(soldTicket) object:nil];
//    [thread2 start];
    
    /*NSOperation NSOperationQuene*/
    //NSInvocationOperation 在没有quene的情况下是在主线程执行任务的
//    NSInvocationOperation *op = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(soldTicket) object:nil];
//    [op start];
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{//在朱队列执行
        [weakself soldTicket];
    }];
    
    
//    [op1 addExecutionBlock:^{
//        [weakself soldTicket];
//    }];
//    [op1 start];
    NSOperationQueue *queue1 = [[NSOperationQueue alloc]init];
    [queue1 addOperation:op1];
    
    
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        [weakself soldTicket];
    }];
    NSOperationQueue *queue2 = [[NSOperationQueue alloc]init];
    [queue2 addOperation:op2];
    
    
    
    
    
    
    
    
}
- (void)soldTicket{
    while (true) {
        //三种加锁方法@synchronized dispatch_semaphore_wait lock 这三种
        //加锁
//        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        @synchronized(self){
        //[lock lock];
            if (ticket > 0) {
                ticket--;
                NSLog( @"%@---%ld",[NSThread currentThread],ticket);
            }else{
                //解锁
                //            dispatch_semaphore_signal(semaphore);
                // [lock unlock];
                break;
            }
        }
//        [lock unlock];
//        dispatch_semaphore_signal(semaphore);
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
