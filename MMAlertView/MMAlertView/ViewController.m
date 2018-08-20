//
//  ViewController.m
//  MMAlertView
//
//  Created by LXN on 2018/8/19.
//  Copyright © 2018年 LXN. All rights reserved.
//

#import "ViewController.h"
#import "XNAlertView.h"
#import "XNView.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *tableview;
}
@property (nonatomic, copy)NSArray *titleArr;
@property (nonatomic, copy)NSArray *detailArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame = CGRectMake(20, 200, 50, 50);
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}
- (void)initData{
    [[NSUserDefaults standardUserDefaults]setObject:@"1" forKey:@"str"];
    _titleArr = @[@"123",@"123",@"123"];
    _detailArr = @[@"我说你是傻逼",@"你到底是不是呢",@"你说对吧哈哈哈哈"];
}
-(void)btnClick{
   
    XNView *view1 = [[XNView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width - 80, 140)];
    XNAlertView *view = [[XNAlertView alloc]initWithCenterView:view1 buttonArray:@[@"确定",@"取消"]];
    view.mainColor = [UIColor blueColor];
    view.title = @"提示";
    //    [self.view addSubview:view];
    [view show];
    
    
    
}
//- (UIView *)cofigTableview{
//    tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width - 80, 200) style:UITableViewStylePlain];
//    tableview.delegate =self;
//    tableview.dataSource = self;
//    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
//    tableview.estimatedRowHeight = 30;
//    [tableview registerNib:[UINib nibWithNibName:@"XNCell" bundle:nil] forCellReuseIdentifier:@"cell"];
//
//    return tableview;
//
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
