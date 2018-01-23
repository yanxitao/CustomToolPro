//
//  JKVIPAppointmentRequest.m
//  jk2cloud
//
//  Created by 燕戏涛 on 2017/9/22.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#import "JKVIPAppointmentRequest.h"

@implementation JKVIPAppointmentRequest

- (NSString *)path {
    
    return @"/im/createGroup";
}

- (NSString *)method {
    
    return @"POST";
}

@end
