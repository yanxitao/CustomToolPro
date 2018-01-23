//
//  JKEmployeeByPositionInfoData.h
//  jk2cloud
//
//  Created by 燕戏涛 on 2017/10/13.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#import "WHBaseObject.h"

@interface JKEmployeeByPositionInfoData : WHBaseObject

@property (nonatomic, assign)           NSInteger                       appointmentCount;
@property (nonatomic, strong)           NSArray                         *appointmentInfoList;
@property (nonatomic, assign)           NSInteger                       basicSalary;
@property (nonatomic, strong)           NSString                        *createTime;
@property (nonatomic, strong)           NSString                        *creater;
@property (nonatomic, assign)           NSInteger                       email;
@property (nonatomic, strong)           NSString                        *entryTime;
@property (nonatomic, assign)           NSInteger                       gender;
@property (nonatomic, strong)           NSString                        *headPortraitId;
@property (nonatomic, strong)           NSString                        *introduction;
@property (nonatomic, strong)           NSString                        *job;
@property (nonatomic, strong)           NSString                        *jobNumber;
@property (nonatomic, strong)           NSString                        *level;
@property (nonatomic, strong)           NSString                        *memo;
@property (nonatomic, strong)           NSString                        *mobile;
@property (nonatomic, strong)           NSString                        *modifier;
@property (nonatomic, strong)           NSString                        *modifyTime;
@property (nonatomic, strong)           NSString                        *name;
@property (nonatomic, strong)           NSString                        *positionId;
@property (nonatomic, strong)           NSString                        *positionName;
@property (nonatomic, strong)           NSArray                         *processingConsumptionList;
@property (nonatomic, assign)           NSInteger                       processingCount;
@property (nonatomic, strong)           NSString                        *recordState;
@property (nonatomic, strong)           NSString                        *salaryType;
@property (nonatomic, assign)           BOOL                            showInWechat;
@property (nonatomic, strong)           NSString                        *specialBusineEs;
@property (nonatomic, strong)           NSArray                         *waitConsumptionList;
@property (nonatomic, assign)           NSInteger                       waitCount;
@property (nonatomic, strong)           NSString                        *wechat;
@property (nonatomic, strong)           NSString                        *workState;
@property (nonatomic, assign)           NSInteger                       workYearNum;

@end
