//
//  JKVIPAppointmentInfoData.h
//  jk2cloud
//
//  Created by 燕戏涛 on 2017/10/20.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#import "WHBaseObject.h"
#import "JKAppointmentCustomerInfoData.h"

@interface JKVIPAppointmentInfoData : WHBaseObject

@property (nonatomic, assign)           BOOL                        adjustTechnician;
@property (nonatomic, assign)           BOOL                        adjustTime;
@property (nonatomic, strong)           NSArray                     *appointmentServerInfoList;
@property (nonatomic, strong)           NSString                    *appointmentSource;
@property (nonatomic, strong)           NSString                    *createTime;
@property (nonatomic, strong)           JKAppointmentCustomerInfoData   *customer;
@property (nonatomic, strong)           NSString                    *customerId;
@property (nonatomic, strong)           NSString                    *customerMobile;
@property (nonatomic, strong)           NSString                    *customerName;
@property (nonatomic, strong)           NSString                    *estimateEndTime;
@property (nonatomic, strong)           NSString                    *estimateStartTime;
@property (nonatomic, assign)           BOOL                        hasConflict;
@property (nonatomic, strong)           NSString                    *modifyTime;
@property (nonatomic, strong)           NSString                    *recordState;
@property (nonatomic, strong)           NSString                    *status;
@property (nonatomic, strong)           NSString                    *userMemo;
@property (nonatomic, strong)           NSString                    *appointmentId;
@property (nonatomic, strong)           NSArray                     *appointmentServerInfoExts;

@end
