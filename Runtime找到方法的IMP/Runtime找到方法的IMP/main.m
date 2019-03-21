//
//  main.m
//  Runtime找到方法的IMP
//
//  Created by LXN on 2019/3/6.
//  Copyright © 2019年 LXN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XNPerson.h"
#import <objc/runtime.h>



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        XNPerson *p = [[XNPerson alloc]init];
        [p test];
        [XNPerson test];
        Method InstanceMothod = class_getInstanceMethod([XNPerson class],@selector(test));
        Method classMothod = class_getClassMethod(object_getClass([XNPerson class]), @selector(test));
        IMP imp = method_getImplementation(InstanceMothod);
        IMP imp2 = method_getImplementation(classMothod);
    }
    return 0;
}
