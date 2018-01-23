//
//  UIImage+Utility.h
//  dmall
//
//  Created by 燕戏涛 on 15/12/12.
//  Copyright © 2015年 dmall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Utility)

- (UIImage *)setImageToBlurWithBlurRadius: (CGFloat)blurRadius;

+ (UIImage *)qrImageForString:(NSString *)string imageSize:(CGFloat)Imagesize logoImageSize:(CGFloat)waterImagesize;

@end
