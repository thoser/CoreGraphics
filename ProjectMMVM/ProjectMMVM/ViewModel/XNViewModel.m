//
//  XNViewModel.m
//  ProjectMMVM
//
//  Created by 杜可春 on 2018/9/12.
//  Copyright © 2018年 杜可春. All rights reserved.
//

#import "XNViewModel.h"
@interface XNViewModel()

@property (nonatomic, readwrite, strong) RACSignal *validLoginSingal;
@property (nonatomic, readwrite, strong) RACCommand *loginCommand;
@end
@implementation XNViewModel
<<<<<<< HEAD
- (void)initilial{
    _loginSingle = [[RACSignal combineLatest:@[RACObserve(self, username),RACObserve(self, password)] reduce:^(NSString *username,NSString *password){
        return @(username.length>0&&password.length>0);
    }]distinctUntilChanged];
    @weakify(self);
    self.loginCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        
        @strongify(self);
    }];
}
+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    [self initialize];
}
=======
- (instancetype)init{
    if(self = [super init]){
        [self initialize];
    }return self;
}
- (void)initialize{
    @weakify(self);
   
    self.validLoginSingal = [[RACSignal combineLatest:@[RACObserve(self, uesename),RACObserve(self, password)] reduce:^(NSString *x,NSString*y){
        return @(x.length>0 && y.length>0);
    }]distinctUntilChanged];
    //数据绑定？
    RAC(self,imageUrl) = [[RACObserve(self, uesename)map:^id(id value) {
        return value;
    }]distinctUntilChanged] ;
    self.loginCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        @weakify(self);
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            @strongify(self);
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [subscriber sendNext:self->_uesename];
                
                [subscriber sendCompleted];
                [subscriber sendError:[NSError errorWithDomain:RACCommandErrorDomain code:RACCommandErrorDomain userInfo:nil]];
            });
            return nil;
        }];
        
    }];
}
>>>>>>> 17d7762e18dc7b2001af88c8acc807033a9f84e7
@end
