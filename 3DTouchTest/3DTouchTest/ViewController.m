//
//  ViewController.m
//  3DTouchTest
//
//  Created by 杜可春 on 2018/9/15.
//  Copyright © 2018年 杜可春. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UIViewControllerPreviewingDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行",indexPath.row];
    
    if ([self respondsToSelector:@selector(traitCollection)])
    {
        if ([self.traitCollection respondsToSelector:@selector(forceTouchCapability)])
        {
            //判断这个设备是否支持3DTouch
            if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable ) {
                //注册3DTouch
                [self registerForPreviewingWithDelegate:(id)self sourceView:cell];
            }
        }
    }
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
//peek下的方法
- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location{
    DetailViewController *detailVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"detail"];
    detailVC.preferredContentSize = CGSizeMake(300, 300);
    CGRect rect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 300);
    previewingContext.sourceRect = rect;
    return detailVC;
}
//pop状态下的方法
- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit{
    [self presentViewController:viewControllerToCommit animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
