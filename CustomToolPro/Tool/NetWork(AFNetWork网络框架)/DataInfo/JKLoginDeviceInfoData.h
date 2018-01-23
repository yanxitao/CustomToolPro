//
//  JKLoginDeviceInfoData.h
//  jk2cloud
//
//  Created by 燕戏涛 on 2017/9/25.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#import "WHBaseObject.h"

@interface JKLoginDeviceInfoData : WHBaseObject

@property (nonatomic, strong)           NSString                    *type;//ios or andiod
@property (nonatomic, strong)           NSString                    *deviceModel;//手机型号
@property (nonatomic, strong)           NSString                    *cpu;
@property (nonatomic, strong)           NSString                    *memory;
@property (nonatomic, strong)           NSString                    *os;
@property (nonatomic, strong)           NSString                    *resolution;//分辨率
@property (nonatomic, strong)           NSString                    *ip;
@property (nonatomic, strong)           NSString                    *versionNum;
@property (nonatomic, strong)           NSString                    *isp;//运营商
@property (nonatomic, strong)           NSString                    *deviceId;
@property (nonatomic, strong)           NSString                    *companyId;
@property (nonatomic, strong)           NSString                    *userId;
@property (nonatomic, strong)           NSString                    *createTime;

@end
