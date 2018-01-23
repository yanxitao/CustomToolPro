//
//  DMShareWeChatModule.m
//  DMall
//
//  Created by 燕戏涛 on 15/6/30.
//  Copyright (c) 2015年 wintech. All rights reserved.
//

#import "DMShareWeChatModule.h"
#import "WXApi.h"
#import "UIImageView+AFNetworking.h"
#import "DMAlertView.h"
#import "SDWebImageDownloader.h"
//#import "WHAppDelegate.h"

#define kWechatAppId    @"wxef482547d3b8f04b"

@interface DMShareWeChatModule () <WXApiDelegate>

@end

@implementation DMShareWeChatModule

- (id) init {
    self = [super init];
    if (self) {
        _scene = WXSceneSession;
        [WXApi registerApp:kWechatAppId];
    }
    return self;
}

- (void) setShareTitleStr:(NSString *)titleStr {
    _shareTest = titleStr;
}

-(void)setShareImageUrl:(NSString *)shareImageUrl{

    _shareImageURL = shareImageUrl;
}


-(void)setShareTextStr:(NSString *)shareTextStr{

    _shareInfoText = shareTextStr;
}



-(void)setShareUrl:(NSString *)shareUrl{

    _shareAPPURL = shareUrl;
}

- (void)setIsWechatPy:(BOOL) yn {
    if (yn) {
        _scene = WXSceneTimeline;
    }
}

- (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [img drawInRect:CGRectMake(0,0, 80, 80)];
    // 从当前context中创建一个改变大小后的图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    //返回新的改变大小后的图片
    return image;
}

- (void) share {
    
    if (![WXApi isWXAppInstalled]) {
        DMAlertView *alertView = [[DMAlertView alloc] initWithTitle:nil message:@"您还没有安装微信，无法进行分享" buttons:@[@"取消"] callBack:^(NSInteger selectIndex) {
        }];
        [alertView show];
        return;
    }
    
//    [DMProgressHUD show];
    
    [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:[NSURL URLWithString:_shareImageURL] options:SDWebImageDownloaderHighPriority progress:nil completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
//        [DMProgressHUD dismiss];
        if (image) {
            
            UIImage *scaleImage = [self scaleToSize:image size:CGSizeMake(80, 80)];
            
            WXMediaMessage * message = [WXMediaMessage message];
            message.title = _shareTest;
            message.description = _shareInfoText;
            [message setThumbImage:scaleImage];
            
            WXWebpageObject * ext = [WXWebpageObject object];
            ext.webpageUrl = _shareAPPURL;
            
            message.mediaObject = ext;
            message.mediaTagName = @"WECHAT_TAG_JUMP_APP";
            
            SendMessageToWXReq * req = [[SendMessageToWXReq alloc] init];
            req.bText = NO;
            req.message = message;
            req.scene = _scene;
            
            [WXApi sendReq:req];
        }
    }];
    
//    UIImage *scaleImage = [self scaleToSize:[UIImage imageNamed:@"Icon"] size:CGSizeMake(80, 80)];
//    
//    WXMediaMessage * message = [WXMediaMessage message];
//    message.title = _shareTest;
//    message.description = _shareInfoText;
//    [message setThumbImage:scaleImage];
//    
//    WXWebpageObject * ext = [WXWebpageObject object];
//    ext.webpageUrl = _shareAPPURL;
//    
//    message.mediaObject = ext;
//    message.mediaTagName = @"WECHAT_TAG_JUMP_APP";
//    
//    SendMessageToWXReq * req = [[SendMessageToWXReq alloc] init];
//    req.bText = NO;
//    req.message = message;
//    req.scene = _scene;
//    
//    [WXApi sendReq:req];
}

#pragma mark --
#pragma mark == WXApiDelegate ==
#pragma mark --

-(void) onReq:(BaseReq*)req {
    if([req isKindOfClass:[GetMessageFromWXReq class]])
    {
        GetMessageFromWXReq *temp = (GetMessageFromWXReq *)req;
        
        // 微信请求App提供内容， 需要app提供内容后使用sendRsp返回
        NSString *strTitle = [NSString stringWithFormat:@"微信请求App提供内容"];
        NSString *strMsg = [NSString stringWithFormat:@"openID: %@", temp.openID];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:strTitle message:strMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        alert.tag = 1000;
        [alert show];

    }
    else if([req isKindOfClass:[ShowMessageFromWXReq class]])
    {
        ShowMessageFromWXReq* temp = (ShowMessageFromWXReq*)req;
        WXMediaMessage *msg = temp.message;
        
        //显示微信传过来的内容
        WXAppExtendObject *obj = msg.mediaObject;
        
        NSString *strTitle = [NSString stringWithFormat:@"微信请求App显示内容"];
        NSString *strMsg = [NSString stringWithFormat:@"openID: %@, 标题：%@ \n内容：%@ \n附带信息：%@ \n缩略图:%lu bytes\n附加消息:%@\n", temp.openID, msg.title, msg.description, obj.extInfo, (unsigned long)msg.thumbData.length, msg.messageExt];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:strTitle message:strMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];

    }
    else if([req isKindOfClass:[LaunchFromWXReq class]])
    {
        LaunchFromWXReq *temp = (LaunchFromWXReq *)req;
        WXMediaMessage *msg = temp.message;
        
        //从微信启动App
        NSString *strTitle = [NSString stringWithFormat:@"从微信启动"];
        NSString *strMsg = [NSString stringWithFormat:@"openID: %@, messageExt:%@", temp.openID, msg.messageExt];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:strTitle message:strMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
;
    }
}

-(void) onResp:(BaseResp*)resp {
    if([resp isKindOfClass:[SendMessageToWXResp class]])
    {
        NSString *strTitle = [NSString stringWithFormat:@"发送媒体消息结果"];
        NSString *strMsg = [NSString stringWithFormat:@"errcode:%d", resp.errCode];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:strTitle message:strMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];

    }
    else if([resp isKindOfClass:[SendAuthResp class]])
    {
        SendAuthResp *temp = (SendAuthResp*)resp;
        
        NSString *strTitle = [NSString stringWithFormat:@"Auth结果"];
        NSString *strMsg = [NSString stringWithFormat:@"code:%@,state:%@,errcode:%d", temp.code, temp.state, temp.errCode];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:strTitle message:strMsg delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];

    }
    else if ([resp isKindOfClass:[AddCardToWXCardPackageResp class]])
    {
        AddCardToWXCardPackageResp* temp = (AddCardToWXCardPackageResp*)resp;
        NSMutableString* cardStr = [[NSMutableString alloc] init];
        for (WXCardItem* cardItem in temp.cardAry) {
            [cardStr appendString:[NSString stringWithFormat:@"cardid:%@ cardext:%@ cardstate:%u\n",cardItem.cardId,cardItem.extMsg,(unsigned int)cardItem.cardState]];
        }
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"add card resp" message:cardStr delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }

}

@end
