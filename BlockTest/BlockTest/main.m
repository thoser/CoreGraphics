//
//  main.m
//  BlockTest
//
//  Created by LXN on 2019/2/26.
//  Copyright © 2019年 LXN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
//static void __main_block_func_0(struct __main_block_impl_0 *__cself) {
//    //    NSLog(@"%d",age);
//};
//static struct __main_block_desc_0 {
//    size_t reserved;
//    size_t Block_size;
//};
//struct __block_impl {
//    void *isa;
//    int Flags;
//    int Reserved;
//    void *FuncPtr;
////    int age;
//};
//struct __main_block_impl_0 {
//    struct __block_impl impl;
//    struct __main_block_desc_0* Desc;
//    int age;
//};


int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        int age = 10;
//        void (^block)(void) = ^{
//            NSLog(@"%d",age);
//        };
//        //block是个oc对象 一个封装了函数调用和函数调用环境的
//        struct __main_block_impl_0 *blockStruct =(__bridge struct __main_block_impl_0 *)block;
//        block();
//        NSLog(@"%@", blockStruct);
        NSString *name = @"12";
        void (^xnBlock)(void) = [^{
            NSLog(@"%@",name);
        }copy];
        xnBlock();
        name = @"123;";
        NSLog(@"%@",name);
        
    }
    return 0;
}
