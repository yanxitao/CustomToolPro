//
//  UIColor+YZExtension.m
//  yz-app
//
//  Created by 燕戏涛 on 16/3/18.
//  Copyright © 2016年 燕戏涛. All rights reserved.
//

#import "UIColor+YZExtension.h"

@implementation UIColor (YZExtension)

+ (UIColor *) colorWithR:(NSInteger)r G:(NSInteger)g B:(NSInteger)b{

    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
}

+ (UIColor *) colorWithString:(NSString *)string{

    if ([string hasPrefix:@"#"])
        string = [string substringFromIndex:1];
    NSScanner * scanner = [NSScanner scannerWithString:string];
    [scanner setCharactersToBeSkipped:[NSCharacterSet symbolCharacterSet]];
    unsigned hex;
    BOOL success = [scanner scanHexInt:&hex];
    
    if (!success)
        return nil;
    
    CGFloat red     = ((hex & 0xFF0000) >> 16) / 255.0f;
    CGFloat green   = ((hex & 0x00FF00) >> 8) / 255.0;
    CGFloat blue    = (hex & 0x0000FF) / 255.0f;
    
    return  [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

@end
