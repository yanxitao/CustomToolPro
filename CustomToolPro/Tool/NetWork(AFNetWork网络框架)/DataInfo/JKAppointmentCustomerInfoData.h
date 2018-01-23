//
//  JKAppointmentCustomerInfoData.h
//  jk2cloud
//
//  Created by 燕戏涛 on 2017/10/20.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#import "WHBaseObject.h"

@interface JKAppointmentCustomerInfoData : WHBaseObject

@property (nonatomic, strong)           NSString                    *changedMemberTime;
@property (nonatomic, strong)           NSString                    *changedPrepareMemberTime;
@property (nonatomic, strong)           NSArray                     *consignProducts;
@property (nonatomic, strong)           NSString                    *createTime;
@property (nonatomic, strong)           NSString                    *creater;
@property (nonatomic, strong)           NSArray                     *customerDiscountConfigs;
@property (nonatomic, strong)           NSString                    *email;
@property (nonatomic, assign)           NSInteger                   gender;
@property (nonatomic, strong)           NSString                    *memberLabel;
@property (nonatomic, strong)           NSString                    *memberLevel;
@property (nonatomic, strong)           NSString                    *memo;
@property (nonatomic, strong)           NSString                    *mobile;
@property (nonatomic, strong)           NSString                    *modifier;
@property (nonatomic, strong)           NSString                    *modifyTime;
@property (nonatomic, strong)           NSString                    *name;
@property (nonatomic, strong)           NSString                    *openID;
@property (nonatomic, assign)           NSInteger                   presentAmount;
@property (nonatomic, assign)           NSInteger                   prestore;
@property (nonatomic, strong)           NSString                    *qq;
@property (nonatomic, assign)           NSInteger                   realPreStoreAmount;
@property (nonatomic, strong)           NSString                    *recordState;
@property (nonatomic, strong)           NSString                    *unionID;


@end
