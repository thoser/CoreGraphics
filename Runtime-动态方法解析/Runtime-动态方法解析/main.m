//
//  main.m
//  Runtime-动态方法解析
//
//  Created by LXN on 2019/3/1.
//  Copyright © 2019年 LXN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XNPerson.h"
#import "XNStudent.h"
#import <objc/runtime.h>
int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        [XNPerson test1];
//        XNStudent *student= [[XNStudent alloc]init];
//        [student test:10];
        NSLog(@"%d",[XNPerson isMemberOfClass:object_getClass([NSObject class]) ]);
        NSLog(@"%d",[[XNPerson class] isMemberOfClass:object_getClass([XNPerson class])]);
        
    }
    return 0;
}
