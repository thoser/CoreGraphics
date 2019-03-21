//
//  XNTeacher.m
//  RuntimeTest
//
//  Created by LXN on 2019/2/28.
//  Copyright © 2019年 LXN. All rights reserved.
//

#import "XNTeacher.h"
#define XNTallMask (1<<0)//左移0位
#define XNRichMask (1<<1)
#define XNHandsomeMask (1<<2)
@interface XNTeacher()
{
    union{
        char bits;
    }_tallRichHandsome;
//    struct{
//        BOOL tall : 1;
//        BOOL rich : 1;
//        BOOL handsome : 1;
//
//    }_tallRichHandsome;
}
@end
@implementation XNTeacher
- (BOOL)isTall{
    return !!(_tallRichHandsome.bits & XNTallMask);
}
- (BOOL)isRich{
    return !!(_tallRichHandsome.bits & XNRichMask);
}
- (BOOL)isHandsome{
    return !!(_tallRichHandsome.bits & XNHandsomeMask);
}
- (void)setHandsome:(BOOL)handsome{
    if (handsome) {
        _tallRichHandsome.bits |= XNHandsomeMask;
    }else{
        _tallRichHandsome.bits &= ~XNHandsomeMask;//~按位取反
    }
}
- (void)setRich:(BOOL)rich{
    if (rich) {
        _tallRichHandsome.bits |= XNRichMask;
    }else{
        _tallRichHandsome.bits &= ~XNRichMask;//~按位取反
    }
}
- (void)setTall:(BOOL)tall{
    if (tall) {
        _tallRichHandsome.bits |= XNTallMask;
    }else{
        _tallRichHandsome.bits &= ~XNTallMask;//~按位取反
    }
    
}
@end
