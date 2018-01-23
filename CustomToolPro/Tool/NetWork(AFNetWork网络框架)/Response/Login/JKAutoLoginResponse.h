//
//  JKAutoLoginResponse.h
//  jk2cloud
//
//  Created by 燕戏涛 on 2017/10/12.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#import "WHBaseResponse.h"
#import "JKLoginCompanyInfoData.h"
#import "JKLoginTokenInfoData.h"
#import "JKLoginUserInfoData.h"

@interface JKAutoLoginResponse : WHBaseResponse

@property (nonatomic, strong)           NSString                *androidUrl;
@property (nonatomic, strong)           NSString                *clientDownloadUrl;
@property (nonatomic, strong)           NSString                *clientVersion;
@property (nonatomic, strong)           JKLoginCompanyInfoData  *company;
@property (nonatomic, strong)           NSString                *companyId;
@property (nonatomic, strong)           NSString                *serverUrl;
@property (nonatomic, strong)           JKLoginTokenInfoData    *token;
@property (nonatomic, strong)           NSString                *type;
@property (nonatomic, strong)           JKLoginUserInfoData     *userMap;
@property (nonatomic, strong)           NSString                *headPortraitId;
@property (nonatomic, strong)           NSString                *job;

@end
