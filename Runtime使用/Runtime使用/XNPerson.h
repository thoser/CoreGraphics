//
//  XNPerson.h
//  Runtime使用
//
//  Created by LXN on 2019/3/5.
//  Copyright © 2019年 LXN. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XNPerson : NSObject
@property (nonatomic ,assign)int age;
@property (nonatomic ,assign)double weight;
@property (nonatomic ,assign)double height;
@property (nonatomic ,copy)NSString *name;
@end

NS_ASSUME_NONNULL_END
