//
//  XNPerson.m
//  多线程的学习
//
//  Created by LXN on 2019/3/16.
//  Copyright © 2019年 LXN. All rights reserved.
//

#import "XNPerson.h"

@implementation XNPerson

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:@"name"];
//    [aCoder encodeObject:@(self.age) forKey:@"age"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    if (self = [super init]) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
    }return self;
}
+ (BOOL)supportsSecureCoding {
    return true;
}
@end
