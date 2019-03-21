//
//  main.m
//  oc对象的本质
//
//  Created by LXN on 2019/2/21.
//  Copyright © 2019年 LXN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>
//nsobject implement
@interface Person : NSObject
{
    @public
    int _no;
}
@end
@implementation Person
@end
@interface Student : Person
{
    @public
    NSString *name;
}
@end
@implementation Student
@end
struct NSObject_IMPL {
    Class isa;//64位中占8个字节
};
struct Student_IMPL {
    struct NSObject_IMPL NSObject_IVARS;
    int _no;
    int array[];
};
struct xn_objc_class{
    
};
//class 是个指向结构体的指针
//typedef struct objc_class *Class;
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /*
        NSObject *obj = [[NSObject alloc]init];
        //底层实现都是c/c++代码->汇编->机器语言
        //对象其实是结构体，因为只有结构体才能包含各种类型的数据
        // xcrun -sdk iphoneos clang -arch arm64 -rewrite-objc main.m -o main-arm64.cpp
        
        //获得nsobject类的实例对象的成员变量所占用的大小：8
        NSLog(@"%zd", class_getInstanceSize([NSObject class]));
        //获得nsobject 指针指向内存的大小>>16
        NSLog(@"%zd",malloc_size((__bridge const void*)obj));
        
        //16个字节 实际上使用了8个字节 八个二进制位代表一个字节 两个十六进制代表一个字节
        
        */
        Student *stu = [[Student alloc]init];
        stu->_no = 4;
        stu->name = @"小明";
        //结构体 的大小必须是最大成员大小的倍数
        //获得nsobject类的实例对象的成员变量所占用的大小：8
        NSLog(@"%zd", class_getInstanceSize([Student class]));
        //获得nsobject 指针指向内存的大小>>16
        NSLog(@"%zd",malloc_size((__bridge struct Person*)stu));
        //sizeof 一个运算符 计算类型的大小
        //getInstanceSize
        NSLog(@"%zd",sizeof([Person class]));
        //实例对象 类对象 元类对象
        //实例对象 就是通过alloc出来的对象 每次alloc出来都是新的instance对象
        NSObject *ojc = [[NSObject alloc]init];
        //isa+其他成员变量
        
        
        //类对象 一个类只有一个类对象 每个类 在内存中只有一个类对象 传的是实例对象
        Class objc2 = [ojc class];
        Class objc3 = [NSObject class];
        Class objc4 = object_getClass(ojc);
        
        //元类对象meta-class 传的类对象 不能用class class返回的始终是 class对象
        Class objc5 = object_getClass([NSObject class]);
        
        
        //实例对象的isa指向类对象。类对象的isa指向元类对象 元类对象的isa指向基类的u元类对象
        //类对象的superclass指向父类的类对象 这样才能调用父类的对象方法 属性等
        //类对象的isa指向元类对象 元类对象的superclass指向父类的元类对象 这样才能调用他的类方法
        //元类对象的父类是空 他的superclass指向的是基类的类对象
    }
    return 0;
}
