//
//  JKGetPassengerFlowInfoByMonthResponse.h
//  jk2cloud
//
//  Created by 燕戏涛 on 2017/10/20.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#import "WHBaseResponse.h"

@interface JKGetPassengerFlowInfoByMonthResponse : WHBaseResponse

@property (nonatomic, assign)               NSInteger                           addMemberCount;
@property (nonatomic, assign)               NSInteger                           addNonMemberTime;
@property (nonatomic, assign)               NSInteger                           customerCount;
@property (nonatomic, assign)               NSInteger                           lastAddMemberCount;
@property (nonatomic, assign)               NSInteger                           lastAddNonMemberTime;
@property (nonatomic, assign)               NSInteger                           lastMemberTotalCount;
@property (nonatomic, assign)               NSInteger                           lastMonthCustomerCount;
@property (nonatomic, assign)               NSInteger                           lastMonthMemberTime;
@property (nonatomic, assign)               NSInteger                           lastMonthSettlementTime;
@property (nonatomic, assign)               NSInteger                           memberCount;
@property (nonatomic, assign)               NSInteger                           memberTime;
@property (nonatomic, assign)               NSInteger                           memberTotalCount;
@property (nonatomic, assign)               NSInteger                           nonMemberTime;
@property (nonatomic, assign)               NSInteger                           settlementTime;

@end
