//
//  ViewController.m
//  ProjectMMVM
//
//  Created by 杜可春 on 2018/9/12.
//  Copyright © 2018年 杜可春. All rights reserved.
//

#import "ViewController.h"
#import "XNViewModel.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *pwdTF;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UITextField *usernameTf;
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (nonatomic, strong)XNViewModel *viewModel;
@property (nonatomic, copy)NSString *imageUrl;
@end

@implementation ViewController
typedef int(^clickBlock)(int a);
- (void)config:(clickBlock)clickBlock{
    NSLog(@"%@",clickBlock);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
<<<<<<< HEAD
    [self config:^int(int a) {
        a = 10;
        return a+1;
=======
    self.viewModel = [[XNViewModel alloc]init];
    [self bindViewModel];
}
- (void)bindViewModel{
    @weakify(self);
    [RACObserve(self.viewModel, self.imageUrl) subscribeNext:^(NSString *url) {
        @strongify(self);
        [self.headImage setImage:[UIImage imageNamed:url]];
    }];
    RAC(self.viewModel,uesename) = self.usernameTf.rac_textSignal;
    RAC(self.viewModel,password) = self.pwdTF.rac_textSignal;
    RAC(self.button,enabled) = self.viewModel.validLoginSingal;
    [[[self.button rac_signalForControlEvents:UIControlEventTouchUpInside ]doNext:^(id x) {
        
    }] subscribeNext:^(id x) {
        @strongify(self);
        [self.viewModel.loginCommand execute:nil];
    }];
    //数据成功
    [self.viewModel.loginCommand.executionSignals.switchToLatest subscribeNext:^(id x) {
        
    }];
    //错误信息
    [self.viewModel.loginCommand.errors subscribeNext:^(id x) {
        
>>>>>>> 17d7762e18dc7b2001af88c8acc807033a9f84e7
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
