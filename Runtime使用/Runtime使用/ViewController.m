//
//  ViewController.m
//  Runtime使用
//
//  Created by LXN on 2019/3/5.
//  Copyright © 2019年 LXN. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "XNPerson.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textfield;

@end

@implementation ViewController
//void saveMsg {
//    NSLog(@"345");
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.textfield.placeholder = @"123";
//    UILabel *label = [self.textfield valueForKeyPath:@"_placeholderLabel"];
//    
//    label.textColor = [UIColor redColor];
    
    [self.textfield setValue:[UIColor yellowColor] forKeyPath:@"_placeholderLabel.textColor"];
    //    self.textfield.placeholder = @"请输入用户名";
    //    NSMutableDictionary *attr = [[NSMutableDictionary alloc]init];
    //    attr[NSUnderlineColorAttributeName] = [UIColor yellowColor];
    //    attr[NSBackgroundColorAttributeName] = [UIColor darkGrayColor];
    //    attr[NSForegroundColorAttributeName] = [UIColor greenColor];
    //    self.textfield.attributedText = [[NSAttributedString alloc]initWithString:@"请输入用户名" attributes:attr];
    
    
    //动态的创建一个类
    Class XNCat = objc_allocateClassPair([XNPerson class], "XNCat", 1);
    class_addIvar(XNCat, "name", 8, 1, "NSString");
    id obj = [[XNCat alloc]init];
    Ivar ivar = class_getInstanceVariable(XNCat, "name");
//    class_addMethod(XNCat, @selector(saveMsg), (IMP)saveMsg, "v");
    object_setIvar(obj,ivar , @"123");
    objc_registerClassPair(XNCat);
    NSLog(@"%@",object_getIvar(obj, ivar));
//    [obj saveMsg];
}

- (XNPerson *)saveMsg:(NSDictionary *)dic{
    XNPerson *person = [[XNPerson alloc]init];
    unsigned int count ;
    Ivar *ivars = class_copyIvarList([XNPerson class], &count);
    for (NSInteger i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        NSString *name = [NSMutableString stringWithUTF8String: ivar_getName(ivar)];
        [person setValue:dic[name] forKey:name];
        
    }
    free(ivars);
    return person;
}

@end
