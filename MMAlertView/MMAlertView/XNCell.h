//
//  XNCell.h
//  MMAlertView
//
//  Created by LXN on 2018/8/20.
//  Copyright © 2018年 LXN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XNCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *detailLab;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (nonatomic, copy) void (^btnclick) (UIButton *sender);
- (void)initWithdata:(NSString *)str;
@end
