//
//  JKEnterpriseListRequest.m
//  jk2cloud
//
//  Created by 燕戏涛 on 2017/9/22.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#import "JKEnterpriseListRequest.h"

@implementation JKEnterpriseListRequest

- (NSString *)path {
    
    return @"/user/searchUserCompanyList";
}

- (NSString *)method {
    
    return @"GET";
}

@end
