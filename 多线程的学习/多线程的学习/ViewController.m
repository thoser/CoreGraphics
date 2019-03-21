//
//  ViewController.m
//  多线程的学习
//
//  Created by LXN on 2019/3/8.
//  Copyright © 2019年 LXN. All rights reserved.
//

#import "ViewController.h"
#import "XNBaseDemo.h"
#import "XNPerson.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (nonatomic, strong) dispatch_source_t timer;
@property (nonatomic, copy)NSData *data;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    XNBaseDemo *demo = [[XNBaseDemo alloc]init];
    //并行 和 串行影响的是任务执行的顺序
//    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
//    //串行
//    dispatch_queue_t queue1 = dispatch_queue_create("queue", DISPATCH_QUEUE_SERIAL);
//    //异步就是创建新的线程 同步就是在当前线程
//    dispatch_async(queue,^{
//        for (NSInteger i = 0; i < 100; i++) {
//            NSLog(@"1111111%ld",(long)i);
//        }
//    });
//    dispatch_async(queue,^{
//        for (NSInteger i = 0; i < 100; i++) {
//            NSLog(@"2222222%ld",(long)i);
//        }
//    });
//    [self nsthreadTest];
    XNPerson *pe = [[XNPerson alloc]init];
    pe.name = @"lxn";
    NSError *error;
    self.data = [NSKeyedArchiver archivedDataWithRootObject:pe requiringSecureCoding:YES error:&error];
    NSLog(@"%@",error);
//    [data writeToFile:filepath atomically:YES];
//    if (iswr) {
//        NSLog(@"成功归档");
//    }
    
}
- (void)nsthreadTest{
//    pthread_t thread;
    //创建
//    NSThread *thread = [[NSThread alloc]initWithBlock:^{
//        NSLog(@"123");
//    }];
//    [thread start];
//    NSLog(@"%@",thread);
//    NSThread *thread = [NSThread performSelectorOnMainThread:<#(nonnull SEL)#> withObject:<#(nullable id)#> waitUntilDone:<#(BOOL)#>]
//    [self performSelector:@selector(gcdTimer) onThread:thread withObject:nil waitUntilDone:NO];
    //直接创建子线程并执行
    [NSThread detachNewThreadWithBlock:^{
        NSLog(@"123");
    }];
//    [NSThread detachNewThreadSelector:<#(nonnull SEL)#> toTarget:<#(nonnull id)#> withObject:<#(nullable id)#>]
    
}
- (void)gcdTimer{
    __weak typeof(self) weakself = self;
    static int i = 0;
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
    self.timer = timer;
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 2.0 * NSEC_PER_SEC, 0.0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakself.button setTitle:[NSString stringWithFormat:@"%d",i++] forState:UIControlStateNormal];
        });
        
    });
    dispatch_resume(timer);
    
    dispatch_source_cancel(timer);
}
- (void)runloopTest{
    dispatch_queue_t queue = dispatch_queue_create(0, 0);
    dispatch_async(queue, ^{
        NSLog(@"1");
        //perform 带有延时的方法本质是定时器
        [self performSelector:@selector(log) withObject:nil afterDelay:.0];
        NSLog(@"3");
    });
}
- (void)log{
    NSLog(@"2");
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSError *error;
    XNPerson *person = [NSKeyedUnarchiver unarchivedObjectOfClass:XNPerson.class fromData:self.data error:&error];
    NSLog(@"%@",person.name);
//    [self runloopTest];
    
}
- (void)groupTest{
    //先执行任务1 任务2 完成后执行任务3
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_queue_create(0, 0);
    dispatch_group_async(group, queue, ^{
        //任务1
    });
    dispatch_group_async(group, queue, ^{
        //任务2
    });
    dispatch_group_notify(group, queue, ^{
        //任务三
    });
}
@end
