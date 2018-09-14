//
//  XNViewModel.h
//  ProjectMMVM
//
//  Created by 杜可春 on 2018/9/12.
//  Copyright © 2018年 杜可春. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XNModel.h"
@interface XNViewModel : NSObject
@property (nonatomic, readonly, copy)NSString *imageUrl;
@property (nonatomic, readwrite, copy)NSString *uesename;
@property (nonatomic, readwrite, copy)NSString *password;
@property (nonatomic, readonly, strong) RACSignal *validLoginSingal;
@property (nonatomic, readonly, strong) RACCommand *loginCommand;
//@property (nonatomic, readonly, strong) RACCommand *
@end
