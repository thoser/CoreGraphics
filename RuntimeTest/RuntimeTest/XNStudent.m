//
//  XNStudent.m
//  RuntimeTest
//
//  Created by LXN on 2019/2/28.
//  Copyright © 2019年 LXN. All rights reserved.
//

#import "XNStudent.h"
@interface XNStudent()
{
    struct{
        BOOL tall : 1;
        BOOL rich : 1;
        BOOL handsome : 1;
        
    }_tallRichHandsome;
}
@end
@implementation XNStudent
- (BOOL)isTall{
    return !!_tallRichHandsome.tall;
}
- (BOOL)isRich{
    return !!_tallRichHandsome.rich;
}
- (BOOL)isHandsome{
    return !!_tallRichHandsome.handsome;
}
- (void)setHandsome:(BOOL)handsome{
    _tallRichHandsome.handsome = handsome;
}
- (void)setRich:(BOOL)rich{
    _tallRichHandsome.rich = rich;
}
- (void)setTall:(BOOL)tall{
    _tallRichHandsome.tall = tall;
    
}
@end
