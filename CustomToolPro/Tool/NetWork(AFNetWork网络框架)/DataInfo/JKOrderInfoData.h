//
//  JKOrderInfoData.h
//  jk2cloud
//
//  Created by 燕戏涛 on 2017/10/17.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#import "WHBaseObject.h"
#import "JKCustomerInfoData.h"

@interface JKOrderInfoData : WHBaseObject

@property (nonatomic, assign)           NSInteger                   debtPrice;
@property (nonatomic, strong)           NSArray                     *consumptionPayTypes;
@property (nonatomic, assign)           NSInteger                   amountPrice;
@property (nonatomic, strong)           NSString                    *consumptionNum;
@property (nonatomic, strong)           NSString                    *createTime;
@property (nonatomic, strong)           NSString                    *creater;
@property (nonatomic, strong)           JKCustomerInfoData          *customer;
@property (nonatomic, strong)           NSString                    *customerId;
@property (nonatomic, strong)           NSString                    *customerMobile;
@property (nonatomic, strong)           NSString                    *customerName;
@property (nonatomic, strong)           NSString                    *endTime;
@property (nonatomic, assign)           BOOL                        hasRotate;
@property (nonatomic, strong)           NSString                    *modifier;
@property (nonatomic, strong)           NSString                    *modifyTime;
@property (nonatomic, assign)           BOOL                        needShowVerifyCode;
@property (nonatomic, assign)           BOOL                        printTicket;
@property (nonatomic, strong)           NSString                    *recordState;
@property (nonatomic, strong)           NSString                    *startTime;
@property (nonatomic, strong)           NSString                    *status;
@property (nonatomic, assign)           NSInteger                   walltePrice;

@end
