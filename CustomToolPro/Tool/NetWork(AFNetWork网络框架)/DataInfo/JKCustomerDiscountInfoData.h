//
//  JKCustomerDiscountInfoData.h
//  jk2cloud
//
//  Created by 燕戏涛 on 2017/10/23.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#import "WHBaseObject.h"

@interface JKCustomerDiscountInfoData : WHBaseObject

@property (nonatomic, assign)           NSInteger                   beforeUpgradeBalance;
@property (nonatomic, assign)           NSInteger                   cashBalance;
@property (nonatomic, strong)           NSString                    *consumptionNum;
@property (nonatomic, strong)           NSString                    *couponType;
@property (nonatomic, strong)           NSString                    *createTime;
@property (nonatomic, strong)           NSString                    *creater;
@property (nonatomic, strong)           NSString                    *customerId;
@property (nonatomic, assign)           NSInteger                   discount;
@property (nonatomic, strong)           NSString                    *discountCouponId;
@property (nonatomic, strong)           NSString                    *discountGroupId;
@property (nonatomic, assign)           NSInteger                   giveAwayAmount;
@property (nonatomic, strong)           NSString                    *inventoryId;
@property (nonatomic, strong)           NSString                    *inventoryName;
@property (nonatomic, assign)           BOOL                        isPayment;
@property (nonatomic, assign)           BOOL                        isShareCoupon;
@property (nonatomic, assign)           BOOL                        isUsed;
@property (nonatomic, assign)           BOOL                        isValid;
@property (nonatomic, assign)           BOOL                        judge;
@property (nonatomic, strong)           NSString                    *memo;
@property (nonatomic, strong)           NSString                    *name;
@property (nonatomic, assign)           NSInteger                   number;
@property (nonatomic, assign)           NSInteger                   presentBalance;
@property (nonatomic, strong)           NSArray                     *selectInventoryList;
@property (nonatomic, assign)           NSInteger                   sellPrice;
@property (nonatomic, strong)           NSArray                     *serverInfoList;
@property (nonatomic, strong)           NSString                    *serverName;
@property (nonatomic, strong)           NSString                    *serverNum;
@property (nonatomic, assign)           BOOL                        storedValue;
@property (nonatomic, assign)           NSInteger                   totalDegree;
@property (nonatomic, strong)           NSString                    *warmTip;

@end
