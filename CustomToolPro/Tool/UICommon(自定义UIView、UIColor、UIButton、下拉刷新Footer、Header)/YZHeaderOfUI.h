//
//  YZHeaderOfUI.h
//  yz-app
//
//  Created by 燕戏涛 on 16/3/28.
//  Copyright © 2016年 燕戏涛. All rights reserved.
//

#ifndef YZHeaderOfUI_h
#define YZHeaderOfUI_h

#define ScreenSize [UIScreen mainScreen].bounds.size
#define DEVICE_VERSION ([[UIDevice currentDevice].systemVersion floatValue])
#define SCREEN_WID ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEI ([UIScreen mainScreen].bounds.size.height)

#endif /* YZHeaderOfUI_h */

#undef          YZCLOSEKEY
#define         YZCLOSEKEY              [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
