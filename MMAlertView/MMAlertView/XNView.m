//
//  XNView.m
//  MMAlertView
//
//  Created by LXN on 2018/8/20.
//  Copyright © 2018年 LXN. All rights reserved.
//

#import "XNView.h"
#import "XNCell.h"
@interface XNView()<UITableViewDelegate,UITableViewDataSource>{
    NSArray *titleArr;
    NSArray *detailArr;
}
@end
@implementation XNView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initData];
        [self configTableview];
    }return self;
}
- (void)initData{
    [[NSUserDefaults standardUserDefaults]setObject:@"1" forKey:@"str"];
    titleArr = @[@"123",@"123",@"123"];
    detailArr = @[@"我说你是傻逼",@"你到底是不是呢",@"你说对吧哈哈哈哈"];
}
- (void)configTableview{
    UITableView *tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width , self.frame.size.height) style:UITableViewStylePlain];
    tableview.delegate =self;
    tableview.dataSource = self;
//    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableview.estimatedRowHeight = 40;
    tableview.rowHeight = UITableViewAutomaticDimension;
    [tableview registerNib:[UINib nibWithNibName:@"XNCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    [tableview reloadData];
    [self addSubview:tableview];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XNCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    NSString *str = [[NSUserDefaults standardUserDefaults]objectForKey:@"str"];
    cell.button.selected = ([str integerValue] == indexPath.row);
    cell.titleLabel.text = titleArr[indexPath.row];
    cell.btnclick = ^(UIButton *sender) {
        [[NSUserDefaults standardUserDefaults]setObject:[NSString stringWithFormat:@"%ld",indexPath.row] forKey:@"str"];
        [tableView reloadData];
    };

    if ([str integerValue] == indexPath.row) {
        cell.detailLab.text = detailArr[indexPath.row];
    }else{
        cell.detailLab.text = @"";
    }
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return titleArr.count;
}

@end
