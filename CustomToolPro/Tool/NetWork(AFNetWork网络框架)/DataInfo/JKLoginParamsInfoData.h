//
//  JKLoginParamsInfoData.h
//  jk2cloud
//
//  Created by 燕戏涛 on 2017/9/25.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#import "WHBaseObject.h"
#import "JKLoginDeviceInfoData.h"

@interface JKLoginParamsInfoData : WHBaseObject

@property (nonatomic, strong)           NSString                    *companyNum;
@property (nonatomic, strong)           NSString                    *loginName;
@property (nonatomic, strong)           NSString                    *password;
@property (nonatomic, strong)           NSString                    *verificationCode;
@property (nonatomic, strong)           NSString                    *iosUrl;
@property (nonatomic, strong)           NSString                    *iosVersion;
@property (nonatomic, strong)           NSString                    *iosDownloadUrl;
@property (nonatomic, strong)           JKLoginDeviceInfoData       *loginDeviceInfo;

@end

