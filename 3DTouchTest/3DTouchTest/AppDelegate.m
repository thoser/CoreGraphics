//
//  AppDelegate.m
//  3DTouchTest
//
//  Created by 杜可春 on 2018/9/15.
//  Copyright © 2018年 杜可春. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //第一种创建方法是在初始化方法用代码创建 如下
    //第二种方法是在infoplist文件中创建
    NSMutableArray *shortcutItems = (NSMutableArray *)[UIApplication sharedApplication].shortcutItems;
    UIApplicationShortcutItem *shortcutItem1 = [[UIApplicationShortcutItem alloc]initWithType:@"com.lxn.openFavorites" localizedTitle:@"喜欢" localizedSubtitle:@"" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeLove] userInfo:nil];
    UIApplicationShortcutItem *shortcutItem2 = [[UIApplicationShortcutItem alloc]initWithType:@"com.lxn.newmessage" localizedTitle:@"消息" localizedSubtitle:nil icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeHome] userInfo:nil];
    [shortcutItems addObject:shortcutItem1];
    [shortcutItems addObject:shortcutItem2];
    [UIApplication sharedApplication].shortcutItems = shortcutItems;
    return YES;
}
//3dtouch点击的监听方法
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler{
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
