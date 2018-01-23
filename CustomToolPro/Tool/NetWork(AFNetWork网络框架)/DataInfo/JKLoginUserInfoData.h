//
//  JKLoginUserInfoData.h
//  jk2cloud
//
//  Created by 燕戏涛 on 2017/9/27.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#import "WHBaseObject.h"
#import "JKLoginPermissionInfoData.h"

@interface JKLoginUserInfoData : WHBaseObject

@property (nonatomic, strong)           NSString                    *birthday;
@property (nonatomic, strong)           NSString                    *companyId;
@property (nonatomic, strong)           NSString                    *creater;
@property (nonatomic, strong)           NSString                    *email;
@property (nonatomic, strong)           NSString                    *expireTime;
@property (nonatomic, strong)           NSString                    *mobile;
@property (nonatomic, strong)           NSString                    *modifier;
@property (nonatomic, strong)           NSString                    *modifyTime;
@property (nonatomic, strong)           NSString                    *name;
@property (nonatomic, strong)           NSArray                     *permission;
@property (nonatomic, strong)           NSString                    *qq;
@property (nonatomic, strong)           NSString                    *receiveSources;
@property (nonatomic, strong)           NSString                    *sex;
@property (nonatomic, strong)           NSString                    *staffId;
@property (nonatomic, strong)           NSString                    *tokenId;
@property (nonatomic, strong)           NSString                    *userId;
@property (nonatomic, strong)           NSString                    *wechat;
@property (nonatomic, strong)           NSString                    *weibo;

@end
