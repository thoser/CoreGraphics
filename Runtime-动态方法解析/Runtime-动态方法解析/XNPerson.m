//
//  XNPerson.m
//  Runtime-动态方法解析
//
//  Created by LXN on 2019/3/1.
//  Copyright © 2019年 LXN. All rights reserved.
//

#import "XNPerson.h"
#import <objc/runtime.h>
@implementation XNPerson
struct method_t {
    SEL sel;
    char *types;
    IMP imp;
};
+ (BOOL)resolveInstanceMethod:(SEL)sel{
    //动态方法解析 如果为空 就进入消息转发 如果不为空 判断是否曾经解析过 解析过后进入消息发送objc_msgSend
    if (sel == @selector(test)) {
        //获取其他方法
//        struct method_t *method = (struct method_t*)class_getInstanceMethod(self, @selector(sendMsg));
        Method method = class_getInstanceMethod(self, @selector(sendMsg));
//        class_addMethod(self, sel, method->ximp, method->types);
        class_addMethod(self, sel, method_getImplementation(method), method_getTypeEncoding(method));
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}
void c_other (id self, SEL _cmd)
{
    NSLog(@"%s",__func__);
}
+ (BOOL)resolveClassMethod:(SEL)sel{
    if (sel == @selector(test1)) {
//        Method mothod = class_getClassMethod(self, @selector(sendMsg1));
        class_addMethod(object_getClass(self), sel, (IMP)c_other, "v16@0:8");
        return YES;
    }
    return YES;
}
- (void)sendMsg{
}
+ (void)sendMsg1{
    
}
@end
