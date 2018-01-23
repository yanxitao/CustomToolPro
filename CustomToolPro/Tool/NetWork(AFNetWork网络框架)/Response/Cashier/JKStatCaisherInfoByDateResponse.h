//
//  JKStatCaisherInfoByDateResponse.h
//  jk2cloud
//
//  Created by 燕戏涛 on 2017/10/18.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#import "WHBaseResponse.h"

@interface JKStatCaisherInfoByDateResponse : WHBaseResponse

@property (nonatomic, assign)               NSInteger               appointmentDoneCount;//预约已完成数量
@property (nonatomic, assign)               NSInteger               appointmentTotalCount;//预约总数量
@property (nonatomic, assign)               NSInteger               curDayExpendPreStoreAmount;//今日消耗预存金额
@property (nonatomic, assign)               NSInteger               curDayShouldAmount;//今日应收金额
@property (nonatomic, assign)               NSInteger               curDayTimesCountExpendAmount;//今日计次优惠消耗
@property (nonatomic, assign)               NSInteger               discountShouldAmount;//优惠应收金额
@property (nonatomic, assign)               NSInteger               lastDayExpendPreStoreAmount;//昨日消耗预存金额
@property (nonatomic, assign)               NSInteger               lastDayShouldAmount;//昨日应收金额
@property (nonatomic, assign)               NSInteger               lastDayTimesCountExpendAmount;//昨日计次优惠消耗
@property (nonatomic, strong)               NSString                *lastStatTime;//最新统计时间
@property (nonatomic, assign)               NSInteger               rechargeShouldAmount;//充值应收金额
@property (nonatomic, assign)               NSInteger               serverShouldAmount;//服务应收金额
@property (nonatomic, assign)               NSInteger               takeOutDeadlineCount;//即将过期-外卖品数量
@property (nonatomic, assign)               NSInteger               takeOutProductShouldAmount;//外卖应收金额
@property (nonatomic, assign)               NSInteger               takeOutShortageCount;//库存不足-外卖品数量
@property (nonatomic, assign)               NSInteger               unTakeOutDeadlineCount;//即将过期-非外卖品数量
@property (nonatomic, assign)               NSInteger               unTakeOutShortageCount;//库存不足-非外卖品数量

@end
