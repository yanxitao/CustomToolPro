//
//  JKLoginToken.h
//  jk2cloud
//
//  Created by 燕戏涛 on 2017/9/27.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#import "WHBaseObject.h"

@interface JKLoginTokenInfoData : WHBaseObject

@property (nonatomic, strong)           NSString                *applyTime;
@property (nonatomic, strong)           NSString                *expireTime;
@property (nonatomic, strong)           NSString                *tokenId;

@end
