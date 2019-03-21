//
//  XNPerson.h
//  RuntimeTest
//
//  Created by LXN on 2019/2/28.
//  Copyright © 2019年 LXN. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XNPerson : NSObject
//@property (nonatomic ,assign ,getter=isTall)BOOL tall;
//@property (nonatomic ,assign ,getter=isRich)BOOL rich;
//@property (nonatomic ,assign ,getter=isHandsome)BOOL handsome;
//- (void)test;
- (void)setRich:(BOOL)rich;
- (void)setTall:(BOOL)tall;
- (void)setHandsome:(BOOL)handsome;
- (BOOL)isRich;
- (BOOL)isTall;
- (BOOL)isHandsome;
@end

NS_ASSUME_NONNULL_END
