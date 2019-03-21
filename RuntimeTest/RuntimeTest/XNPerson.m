//
//  XNPerson.m
//  RuntimeTest
//
//  Created by LXN on 2019/2/28.
//  Copyright © 2019年 LXN. All rights reserved.
//

#import "XNPerson.h"
//#define XNTallMask 1
//#define XNRichMask 2
//#define XNHandsomeMask 4
#define XNTallMask (1<<0)//左移0位
#define XNRichMask (1<<1)
#define XNHandsomeMask (1<<2)
@interface XNPerson()
{
    char _tallRichHandsome;
}
@end
@implementation XNPerson
- (instancetype)init{
    if (self = [super init]) {
        _tallRichHandsome = 0b00000111;
    }return self;
}
- (BOOL)isTall{
    return !!(_tallRichHandsome & XNTallMask);
}
- (BOOL)isRich{
    return !!(_tallRichHandsome & XNRichMask);
}
- (BOOL)isHandsome{
    return !!(_tallRichHandsome & XNHandsomeMask);
}
- (void)setHandsome:(BOOL)handsome{
    if (handsome) {
        _tallRichHandsome |= XNHandsomeMask;
    }else{
        _tallRichHandsome &= ~XNHandsomeMask;//~按位取反
    }
}
- (void)setRich:(BOOL)rich{
    if (rich) {
        _tallRichHandsome |= XNRichMask;
    }else{
        _tallRichHandsome &= ~XNRichMask;//~按位取反
    }
}
- (void)setTall:(BOOL)tall{
    if (tall) {
        _tallRichHandsome |= XNTallMask;
    }else{
        _tallRichHandsome &= ~XNTallMask;//~按位取反
    }
    
}

@end
