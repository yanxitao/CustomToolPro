//
//  DMShareWeChatModule.h
//  DMall
//
//  Created by 燕戏涛 on 15/6/30.
//  Copyright (c) 2015年 wintech. All rights reserved.
//

#import "DMShareBaseModule.h"
#import "WXApi.h"

@interface DMShareWeChatModule : DMShareBaseModule<WXApiDelegate>
{
    enum WXScene _scene;
}

@property (strong, nonatomic) NSString      *shareInfoText;
@property (strong, nonatomic) NSString      *shareAPPURL;
@property (strong, nonatomic) NSString      *shareImageURL;
@property (strong, nonatomic) NSString      *shareTest;

@end
