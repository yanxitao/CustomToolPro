//
//  JKGetInventoryAndExpendInfoByMonthResponse.h
//  jk2cloud
//
//  Created by 燕戏涛 on 2017/10/20.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#import "WHBaseResponse.h"
#import "JKProductPurchaseAmountByTypeInfoData.h"

@interface JKGetInventoryAndExpendInfoByMonthResponse : WHBaseResponse

@property (nonatomic, assign)               NSInteger                           damagedAmount;
@property (nonatomic, assign)               NSInteger                           inventoryAmount;
@property (nonatomic, assign)               NSInteger                           inventoryCheckCount;
@property (nonatomic, assign)               NSInteger                           lastMonthDamagedAmount;
@property (nonatomic, assign)               NSInteger                           lastMonthInventoryAmount;
@property (nonatomic, assign)               NSInteger                           lastMonthInventoryCheckCount;
@property (nonatomic, assign)               NSInteger                           lastMonthNegativeInventoryAmount;
@property (nonatomic, assign)               NSInteger                           lastMonthPurchaseAmount;
@property (nonatomic, assign)               NSInteger                           lastMonthRtPurchaseAmount;
@property (nonatomic, assign)               NSInteger                           lastMonthTakeoutProductAmount;
@property (nonatomic, assign)               NSInteger                           negativeInventoryAmount;
@property (nonatomic, strong)               JKProductPurchaseAmountByTypeInfoData   *productPurchaseAmountByType;
@property (nonatomic, assign)               NSInteger                           purchaseAmount;
@property (nonatomic, assign)               NSInteger                           rtPurchaseAmount;
@property (nonatomic, assign)               NSInteger                           takeOutProductAmount;

@end
