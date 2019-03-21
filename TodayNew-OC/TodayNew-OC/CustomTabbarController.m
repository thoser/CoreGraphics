//
//  CustomTabbarController.m
//  TodayNew-OC
//
//  Created by LXN on 2019/3/21.
//  Copyright © 2019年 LXN. All rights reserved.
//

#import "CustomTabbarController.h"
#import "CustomBar.h"
#import "BaseNavigationController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourViewController.h"
#import "CustomBar.h"
@interface CustomTabbarController ()

@end

@implementation CustomTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addChildViewController];
    self.tabBar.tintColor = [UIColor colorWithRed:245/255.0 green:90/255.0 blue:93/255.0 alpha:1.0];
    [self setValue:[[CustomBar alloc]init] forKey:@"tabBar"];
    
}
- (void)addChildViewController{
    [self setChildControler:[[FirstViewController alloc]init] Title:@"首页" image:@"home_tabbar_32x32_" selectImage:@"home_tabbar_press_32x32_"];
    [self setChildControler:[[SecondViewController alloc]init] Title:@"视频" image:@"weitoutiao_tabbar_32x32_" selectImage:@"weitoutiao_tabbar_press_32x32_"];
    [self setChildControler:[[ThirdViewController alloc]init] Title:@"小视频" image:@"huoshan_tabbar_32x32_" selectImage:@"huoshan_tabbar_press_32x32_"];
    [self setChildControler:[[FourViewController alloc]init] Title:@"我的" image:@"mine_tabbar_32x32_" selectImage:@"mine_tabbar_press_32x32_"];
}
- (void)setChildControler:(UIViewController *)viewController Title:(NSString *)title image:(NSString *)imageName selectImage:(NSString *)selectImage{
    viewController.title = title;
    viewController.tabBarItem.image = [UIImage imageNamed:imageName];
    viewController.tabBarItem.selectedImage = [UIImage imageNamed:selectImage];
    BaseNavigationController *nav = [[BaseNavigationController alloc]initWithRootViewController:viewController];
    
    [self addChildViewController:nav];
    
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
