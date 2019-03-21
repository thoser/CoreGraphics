//
//  main.m
//  RuntimeTest
//
//  Created by LXN on 2019/2/28.
//  Copyright © 2019年 LXN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XNPerson.h"
#import "XNTeacher.h"
#import "XNStudent.h"
#import <objc/runtime.h>
//runtime :运行时 c语言的api
void test()
{
    NSLog(@"%s",__func__);
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        test();
//        XNPerson *person = [[XNPerson alloc]init];
////        [person setTall:NO];
//        person.tall = NO;
//        NSLog(@"%d %d %d ",person.isTall,person.isRich,person.isHandsome);
//        XNStudent *student = [[XNStudent alloc]init];
//        //        [person setTall:NO];
//        student.tall = YES;
//        student.rich = YES;
//        student.handsome = NO;
//        NSLog(@"%d %d %d ",student.isTall,student.isRich,student.isHandsome);
//        NSLog(@"%zd",class_getInstanceSize([XNPerson class]));
        XNTeacher *teacher = [[XNTeacher alloc]init];
        //        [person setTall:NO];
        teacher.tall = YES;
        teacher.rich = YES;
        teacher.handsome = NO;
        NSLog(@"%d %d %d ",teacher.isTall,teacher.isRich,teacher.isHandsome);
    }
    return 0;
}
