//
//  UIViewController+BackButtonHandler.h
//  bjeeaoa
//
//  Created by 燕戏涛 on 16/5/12.
//  Copyright © 2016年 yzhtech. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BackButtonHandlerProtocol <NSObject>

@optional

- (BOOL)navigationShouldPopOnBackButton;

@end

@interface UIViewController (BackButtonHandler) <BackButtonHandlerProtocol>

@end
