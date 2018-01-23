//
//  JKLoginLocationInfoData.h
//  jk2cloud
//
//  Created by 燕戏涛 on 2017/9/27.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#import "WHBaseObject.h"

@interface JKLoginLocationInfoData : WHBaseObject

@property (nonatomic, strong)           NSString                *code;
@property (nonatomic, strong)           NSString                *createTime;
@property (nonatomic, strong)           NSString                *creater;
@property (nonatomic, strong)           NSString                *latitude;
@property (nonatomic, strong)           NSString                *longitude;
@property (nonatomic, strong)           NSString                *modifier;
@property (nonatomic, strong)           NSString                *modifyTime;
@property (nonatomic, strong)           NSString                *name;
@property (nonatomic, strong)           NSString                *recordState;
@property (nonatomic, strong)           NSString                *registerCityCode;
@property (nonatomic, strong)           NSString                *registerCityName;
@property (nonatomic, strong)           NSString                *registerProvinceCode;
@property (nonatomic, strong)           NSString                *registerProvinceName;

@end
