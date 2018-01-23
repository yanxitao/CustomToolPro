//
//  JKLoginRequest.m
//  jk2cloud
//
//  Created by 燕戏涛 on 2017/9/22.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#import "JKLoginRequest.h"

@implementation JKLoginRequest

- (NSString *)path {
    
    return @"/login/goToLogin";
}

- (NSString *)method {
    
    return @"POST";
}

@end
