//
//  ViewController.m
//  KVOTest
//
//  Created by LXN on 2019/2/23.
//  Copyright © 2019年 LXN. All rights reserved.
//

#import "ViewController.h"
#import "XNPerson.h"
@interface ViewController ()
@property (nonatomic ,strong)XNPerson *person;
@end
//类扩展编译的时候就已经放在类中了
//类别 是运行时 rumtime合并到类中
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.person = [[XNPerson alloc]init];
    self.person.age = 10;
    // Do any additional setup after loading the view, typically from a nib.
    [self.person addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
}
- (void)dealloc{
    [self.person removeObserver:self forKeyPath:@"age"];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.person.age = 20;
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"监听到%@的属性%@改成%@",object,keyPath,change);
}
@end
