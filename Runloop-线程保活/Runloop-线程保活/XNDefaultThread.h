//
//  XNDefaultThread.h
//  Runloop-线程保活
//
//  Created by LXN on 2019/3/8.
//  Copyright © 2019年 LXN. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^XNThreadBlock )(void);
NS_ASSUME_NONNULL_BEGIN

@interface XNDefaultThread : NSObject
- (void)run;
- (void)stop;
- (void)excuteTask:(XNThreadBlock)task;
@end

NS_ASSUME_NONNULL_END
