//
//  JKPayTypeInfoData.h
//  jk2cloud
//
//  Created by 燕戏涛 on 2017/10/19.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#import "WHBaseObject.h"

@interface JKPayTypeInfoData : WHBaseObject

@property (nonatomic, strong)           NSString                    *consumptionNum;
@property (nonatomic, strong)           NSString                    *createTime;
@property (nonatomic, assign)           NSInteger                   payPrice;
@property (nonatomic, strong)           NSString                    *payType;

@end
