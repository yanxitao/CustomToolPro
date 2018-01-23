//
//  UIImage+withDownLoadURL.m
//  CustomTool
//
//  Created by 燕戏涛 on 2017/11/24.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#import "UIImage+withDownLoadURL.h"
#import <objc/runtime.h>

@implementation UIImage (withDownLoadURL)

- (void)setDownLoadURL:(NSString *)downLoadURL {
    objc_setAssociatedObject(self, @selector(downLoadURL), downLoadURL, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)downLoadURL {
    return objc_getAssociatedObject(self, @selector(downLoadURL));
}

@end
