//
//  DetailViewController.m
//  3DTouchTest
//
//  Created by 杜可春 on 2018/9/15.
//  Copyright © 2018年 杜可春. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//peek状态下的选项
- (NSArray<id<UIPreviewActionItem>> *)previewActionItems{
    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"one" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"didClickCancel");
    }];
    UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"two" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"didClickCancel");
    }];
    return @[action1,action2];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
