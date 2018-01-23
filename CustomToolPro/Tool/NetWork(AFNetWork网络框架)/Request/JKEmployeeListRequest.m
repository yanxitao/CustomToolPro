//
//  JKEmployeeListRequest.m
//  jk2cloud
//
//  Created by 燕戏涛 on 2017/9/22.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#import "JKEmployeeListRequest.h"

@implementation JKEmployeeListRequest

- (NSString *)path {
    
    return @"/employee/getEmployeeByPageOrderbyJobNumber";
}

- (NSString *)method {
    
    return @"GET";
}

@end
