//
//  UINavigationController+ShouldPopOnBackButton.m
//  bjeeaoa
//
//  Created by 燕戏涛 on 16/5/12.
//  Copyright © 2016年 yzhtech. All rights reserved.
//

#import "UINavigationController+ShouldPopOnBackButton.h"
#import "UIViewController+BackButtonHandler.h"
//#import "JKViewController+BackButtonHandler.h"

@implementation UINavigationController (ShouldPopOnBackButton)

- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem*)item {
    
    if([self.viewControllers count] < [navigationBar.items count]) {
        return YES;
    }
    
    BOOL shouldPop = YES;
    UIViewController* vc = [self topViewController];
    if([vc respondsToSelector:@selector(navigationShouldPopOnBackButton)]) {
        shouldPop = [vc navigationShouldPopOnBackButton];
    }
    
//    JKViewController* vc = [self vc.topViewController];
//    if([vc respondsToSelector:@selector(navigationShouldPopOnBackButton)]) {
//        shouldPop = [vc navigationShouldPopOnBackButton];
//    }
    
    if(shouldPop) {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self popViewControllerAnimated:YES];
        });
    } else {
        // Workaround for iOS7.1. Thanks to @boliva - http://stackoverflow.com/posts/comments /34452906
//        for(UIView *subview in [navigationBar subviews]) {
//            if(subview.alpha < 1.) {
//                [UIView animateWithDuration:.25 animations:^{
//                    subview.alpha = 1.;
//                }];
//            }
//        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self popToViewController:self.viewControllers[1] animated:YES];
            
            //            [self popViewControllerAnimated:YES];
        });

    }
    
    return NO;
}

@end
