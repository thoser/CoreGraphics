//
//  ViewController.m
//  MediaPlayer
//
//  Created by LXN on 2018/9/17.
//  Copyright © 2018年 LXN. All rights reserved.
//

#import "ViewController.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
#import "EmitterLayer.h"
@interface ViewController ()
@property(nonatomic,strong)AVPlayerViewController *player;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    NSString *path = [[NSBundle mainBundle]pathForResource:@"kiwi.mp4" ofType:nil];
//    AVPlayerViewController *vc = [[AVPlayerViewController alloc]init];
//    vc.view.frame = self.view.frame;
//    vc.player = [[AVPlayer alloc]initWithURL:[NSURL fileURLWithPath:path]];
//    [self addChildViewController:vc];
//    [self.view addSubview:vc.view];
//    [vc.player play];
    EmitterLayer *view = [[EmitterLayer alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) withImage:nil];
    [self.view addSubview:view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
