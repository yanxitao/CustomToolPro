//
//  JKLoginRequest.h
//  jk2cloud
//
//  Created by 燕戏涛 on 2017/9/22.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#import "WHBaseRequest.h"
//#import "JKLoginParamsInfoData.h"
//#import "JKLoginDeviceInfoData.h"

@interface JKLoginRequest : WHBaseRequest

//@property (nonatomic, strong)           JKLoginParamsInfoData               *loginParams;

@property (nonatomic, strong)           NSString                    *companyNum;
@property (nonatomic, strong)           NSString                    *loginName;
@property (nonatomic, strong)           NSString                    *password;
@property (nonatomic, strong)           NSString                    *verificationCode;
//@property (nonatomic, strong)           JKLoginDeviceInfoData       *loginDeviceInfo;


@end
