//
//  DMShareSinaWeiboModule.h
//  DMall
//
//  Created by wangzhenchao on 15/6/30.
//  Copyright (c) 2015年 wintech. All rights reserved.
//

#import "DMShareBaseModule.h"

@interface DMShareSinaWeiboModule : DMShareBaseModule

@property (nonatomic, copy) NSString                *wbtoken;
@property (nonatomic, copy) NSString                *titleStr;
@property (nonatomic, copy) NSString                *shareUrl;
@property (nonatomic, copy) NSString                *shareImageUrl;
@property (nonatomic, copy) NSString                *shareTextStr;

@end
