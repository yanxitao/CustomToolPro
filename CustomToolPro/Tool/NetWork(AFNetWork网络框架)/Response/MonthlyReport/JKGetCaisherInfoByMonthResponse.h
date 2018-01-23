//
//  JKGetCaisherInfoByMonthResponse.h
//  jk2cloud
//
//  Created by 燕戏涛 on 2017/10/20.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#import "WHBaseResponse.h"
#import "JKTlementAmountByTypeInfoData.h"

@interface JKGetCaisherInfoByMonthResponse : WHBaseResponse

@property (nonatomic, strong)               NSString                            *type;
@property (nonatomic, strong)               NSString                            *cashAmount;
@property (nonatomic, strong)               NSString                            *debtAmount;
@property (nonatomic, strong)               NSString                            *discountGroupRecordCount;
@property (nonatomic, strong)               NSString                            *expendCashAmount;
@property (nonatomic, strong)               NSString                            *expendPreStoreAmount;
@property (nonatomic, strong)               NSString                            *expendPresentAmount;
@property (nonatomic, strong)               NSString                            *lastMonthDebtAmount;
@property (nonatomic, strong)               NSString                            *lastMonthDiscountGroupRecordCount;
@property (nonatomic, strong)               NSString                            *lastMonthExpendPreStoreAmount;
@property (nonatomic, strong)               NSString                            *lastMonthNewPreStoreAmount;
@property (nonatomic, strong)               NSString                            *lastMonthPracticalAmount;
@property (nonatomic, strong)               NSString                            *lastMonthPreStoreAmount;
@property (nonatomic, strong)               NSString                            *lastMonthSettlementCount;
@property (nonatomic, strong)               NSString                            *lastMonthShouldAmount;
@property (nonatomic, strong)               NSString                            *practicalAmount;
@property (nonatomic, strong)               NSString                            *preStoreAmount;
@property (nonatomic, strong)               NSString                            *presentAmount;
@property (nonatomic, strong)               JKTlementAmountByTypeInfoData       *settlementAmountByType;
@property (nonatomic, strong)               NSString                            *settlementCount;
@property (nonatomic, strong)               NSString                            *shouldAmount;
@property (nonatomic, strong)               NSString                            *addedCashAmount;
@property (nonatomic, strong)               NSString                            *addedPreStoreAmount;
@property (nonatomic, strong)               NSString                            *addedPresentAmount;
@property (nonatomic, strong)               NSString                            *lastMonthAddedPreStoreAmount;

@end
