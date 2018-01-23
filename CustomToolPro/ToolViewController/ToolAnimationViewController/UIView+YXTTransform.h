//
//  UIView+YXTTransform.h
//  TestCALayer
//
//  Created by 燕戏涛 on 2017/10/27.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YXTTransform)<CAAnimationDelegate>

- (void)YXTTransform_circleColor_toColor:(UIColor *)toColor Duration:(CGFloat)duration StartPoint:(CGPoint)startPoint;
- (void)YXTTransform_circleImage_toImage:(UIImage *)toImage Duration:(CGFloat)duration StartPoint:(CGPoint)startPoint;
- (void)YXTTransform_beginZoom_max:(CGFloat)max min:(CGFloat)min;
- (void)YXTTransForm_StopZoom;

@end
