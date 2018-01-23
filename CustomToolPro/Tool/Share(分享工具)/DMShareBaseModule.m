//
//  DMShareBaseModule.m
//  DMall
//
//  Created by wangzhenchao on 15/6/30.
//  Copyright (c) 2015年 wintech. All rights reserved.
//

#import "DMShareBaseModule.h"
#import "DMShareSinaWeiboModule.h"
#import "DMShareWeChatModule.h"


@implementation DMShareBaseModule


+ (instancetype) DMShareBaseModuleWithType:(ShareModuleType) type {
    DMShareBaseModule       *shareBasePt = nil;
    switch (type) {
        case ShareModuleTypeWeChat:
            shareBasePt = [[DMShareWeChatModule alloc] init];
            break;
        case ShareModuleTypeSinaWebo:
            shareBasePt = [[DMShareSinaWeiboModule alloc] init];
            break;
            
        default:
            break;
    }
    
    return shareBasePt;
}


#pragma mark --
#pragma mark == interface method need realy realization in sub class ==
#pragma mark --
- (void) setShareTitleStr:(NSString  *) titleStr {
    
}

- (void) setShareUrl:(NSString  *) shareUrl {
    
}


- (void) setShareImageUrl:(NSString *) shareImageUrl {
    
}


- (void) setShareTextStr:(NSString *) shareTextStr {
    
}

- (void) share {
    
}

@end
