//
//  DMShareBaseModule.h
//  DMall
//
//  Created by wangzhenchao on 15/6/30.
//  Copyright (c) 2015年 wintech. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ShareModuleType) {
    ShareModuleTypeWeChat = 0,
    ShareModuleTypeSinaWebo
};


@interface DMShareBaseModule : NSObject

+ (instancetype) DMShareBaseModuleWithType:(ShareModuleType) type;


#pragma mark --
#pragma mark == interface method need realy realization in sub class ==
#pragma mark --
- (void) setShareTitleStr:(NSString  *) titleStr;
- (void) setShareUrl:(NSString  *) shareUrl;
- (void) setShareImageUrl:(NSString *) shareImageUrl;
- (void) setShareTextStr:(NSString *) shareTextStr;

- (void) share;

@end

@interface DMShareBaseModule (ShareModuleTypeQQ)

- (void)setIsWechatPy:(BOOL) yn;

@end
