//
//  main.m
//  深浅拷贝
//
//  Created by LXN on 2019/3/19.
//  Copyright © 2019年 LXN. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *array = [NSArray array];
        NSArray *array1 = [array copy];
        NSArray *array2 = [array mutableCopy];
        NSLog(@"%p %p %p",array,array1,array2);
    }
    return 0;
}
