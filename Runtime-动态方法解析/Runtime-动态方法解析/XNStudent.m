//
//  XNStudent.m
//  Runtime-动态方法解析
//
//  Created by LXN on 2019/3/2.
//  Copyright © 2019年 LXN. All rights reserved.
//

#import "XNStudent.h"
#import <objc/runtime.h>
#import "XNCat.h"
@implementation XNStudent
+ (BOOL)resolveInstanceMethod:(SEL)sel{
    
    return YES;
}
//第一步 进入这个方法
- (id)forwardingTargetForSelector:(SEL)aSelector{
    //但绘制不为空 进入消息发送
    //返回值为空 进入methodSignatureForSelector
    return nil;
}
//第二步
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    //返回值为空GG
    //返回值不为空：调用forwardInvocation
    
    return [super methodSignatureForSelector:aSelector];
}
//第三步
- (void)forwardInvocation:(NSInvocation *)anInvocation{
//    anInvocation.target
}
//- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
//{
//    //返回值为空GG
//    //返回值不为空：调用forwardInvocation
//    if (aSelector == @selector(test:)) {
//        return [NSMethodSignature signatureWithObjCTypes:"v24@0:8i18"];
//    }
//    return [super methodSignatureForSelector:aSelector];
//
//}
//anInvocation封装了一个方法调用
//anInvocation.target 方法调用者
//anInvocation.selector 方法名
//[anInvocation getArgument:NULL atIndex:0]; 方法参数
//- (void)forwardInvocation:(NSInvocation *)anInvocation{
//    NSLog(@"%s",__func__);
//    int age;
//    [anInvocation getArgument:&age atIndex:2];
//    NSLog(@"%d",age + 20);
////    [anInvocation invokeWithTarget:[[XNCat alloc]init]];
//
//}
- (void)zhuanfa{
    
}
@end
