//
//  XNStudent.h
//  RuntimeTest
//
//  Created by LXN on 2019/2/28.
//  Copyright © 2019年 LXN. All rights reserved.
//

#import "XNPerson.h"

NS_ASSUME_NONNULL_BEGIN

@interface XNStudent : XNPerson
- (void)setRich:(BOOL)rich;
- (void)setTall:(BOOL)tall;
- (void)setHandsome:(BOOL)handsome;
- (BOOL)isRich;
- (BOOL)isTall;
- (BOOL)isHandsome;
@end

NS_ASSUME_NONNULL_END
