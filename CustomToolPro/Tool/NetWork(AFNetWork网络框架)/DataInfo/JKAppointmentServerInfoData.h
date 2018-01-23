//
//  JKAppointmentServerInfoData.h
//  jk2cloud
//
//  Created by 燕戏涛 on 2017/10/20.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#import "WHBaseObject.h"

@interface JKAppointmentServerInfoData : WHBaseObject

@property (nonatomic, assign)           NSInteger                   cost;
@property (nonatomic, strong)           NSString                    *createTime;
@property (nonatomic, strong)           NSString                    *creater;
@property (nonatomic, assign)           NSInteger                   estimateTime;
@property (nonatomic, strong)           NSString                    *introduction;
@property (nonatomic, strong)           NSString                    *memo;
@property (nonatomic, strong)           NSString                    *modifier;
@property (nonatomic, strong)           NSString                    *modifyTime;
@property (nonatomic, strong)           NSString                    *name;
@property (nonatomic, strong)           NSString                    *recordState;
@property (nonatomic, assign)           NSInteger                   sellPrice;
@property (nonatomic, strong)           NSString                    *serverImg;
@property (nonatomic, strong)           NSString                    *serverNum;
@property (nonatomic, strong)           NSString                    *serverTypeCode;
@property (nonatomic, assign)           BOOL                        showInWechat;

@end
