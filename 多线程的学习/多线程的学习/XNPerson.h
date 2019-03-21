//
//  XNPerson.h
//  多线程的学习
//
//  Created by LXN on 2019/3/16.
//  Copyright © 2019年 LXN. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XNPerson : NSObject<NSCoding,NSSecureCoding>
@property (nonatomic, copy)NSString *name;
//@property (nonatomic, copy)NSString *address;
//@property (nonatomic, assign)int age;

@end

NS_ASSUME_NONNULL_END
