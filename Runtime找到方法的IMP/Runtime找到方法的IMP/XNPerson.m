//
//  XNPerson.m
//  Runtime找到方法的IMP
//
//  Created by LXN on 2019/3/6.
//  Copyright © 2019年 LXN. All rights reserved.
//

#import "XNPerson.h"

@implementation XNPerson
- (void)test{
    NSLog(@"%s",__func__);
}
+ (void)test{
    NSLog(@"%s",__func__);
}
@end
