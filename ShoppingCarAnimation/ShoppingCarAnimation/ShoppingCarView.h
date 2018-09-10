//
//  ShoppingCarView.h
//  ShoppingCarAnimation
//
//  Created by 杜可春 on 2018/9/10.
//  Copyright © 2018年 杜可春. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShoppingCarView : UIView
+ (void)addShoppingCarWithGoodsImage:(UIImage *)image startPoint:(CGPoint )startPoint endPoint:(CGPoint )endPoint completion:(void(^)(BOOL finish))completion;
@end
