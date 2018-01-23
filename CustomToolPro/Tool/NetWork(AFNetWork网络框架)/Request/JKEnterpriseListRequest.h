//
//  JKEnterpriseListRequest.h
//  jk2cloud
//
//  Created by 燕戏涛 on 2017/9/22.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#import "WHBaseRequest.h"

@interface JKEnterpriseListRequest : WHBaseRequest

@property (nonatomic, strong)           NSString                    *validCode;
@property (nonatomic, strong)           NSString                    *mobile;
@property (nonatomic, strong)           NSString                    *pwd;

@end
