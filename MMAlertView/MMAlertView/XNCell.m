//
//  XNCell.m
//  MMAlertView
//
//  Created by LXN on 2018/8/20.
//  Copyright © 2018年 LXN. All rights reserved.
//

#import "XNCell.h"

@implementation XNCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)btnClick:(UIButton *)sender {

    if (self.btnclick) {
        self.btnclick(sender);
    }
}
-(void)initWithdata:(NSString *)str{
    if ([str isEqualToString:@"1"]) {
        
    }else if ([str isEqualToString:@"2"]){
        
    }else{
        
    }
}
@end
