//
//  DMShareSinaWeiboModule.m
//  DMall
//
//  Created by wangzhenchao on 15/6/30.
//  Copyright (c) 2015年 wintech. All rights reserved.
//

#import "DMShareSinaWeiboModule.h"
#import "WeiboSDK.h"
//#import "WHAppDelegate.h"

#define kRedirectURI    @"https://api.weibo.com/oauth2/default.html"
#define kSinaWeiboAppKey    @""

@interface DMShareSinaWeiboModule () <WeiboSDKDelegate, WBHttpRequestDelegate> {
    
}

@end


@implementation DMShareSinaWeiboModule

- (id) init {
    self = [super init];
    if(self) {
        [WeiboSDK enableDebugMode:NO];
        [WeiboSDK registerApp:kSinaWeiboAppKey];
    }
    return self;
}


#pragma mark --
#pragma mark == interface method realization in sub class ==
#pragma mark --

- (void) setShareTitleStr:(NSString *)titleStr {
    _titleStr = titleStr;
}

- (void) setShareUrl:(NSString *)shareUrl {
    _shareUrl = shareUrl;
}

- (void) setShareImageUrl:(NSString *)shareImageUrl {
    _shareImageUrl = shareImageUrl;
}

- (void) setShareTextStr:(NSString *)shareTextStr {
    _shareTextStr = shareTextStr;
}

- (void) share {
    WBAuthorizeRequest *authRequest = [WBAuthorizeRequest request];
    authRequest.redirectURI = kRedirectURI;
    authRequest.scope = @"all";
    
    
    WBMessageObject *message = [WBMessageObject message];
    message.text = [NSString stringWithFormat:@"%@, %@", self.titleStr, self.shareUrl];
//    message.text = [NSString stringWithFormat:@"%@, %@", @"测试测试测试测试", @"https://www.baidu.com"];
    WBImageObject *imageObj = [WBImageObject object];
    
//    [DMProgressHUD show];
//    
//    [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:[NSURL URLWithString:self.shareImageUrl] options:SDWebImageDownloaderHighPriority progress:nil completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
//        [DMProgressHUD dismiss];
//        if (image) {
//            UIImage *scaleImage = [self scaleToSize:image size:CGSizeMake(160, 160)];
//            NSData *data;
//            if (UIImagePNGRepresentation(scaleImage) == nil) {
//                data = UIImageJPEGRepresentation(scaleImage, 1);
//            } else {
//                data = UIImagePNGRepresentation(scaleImage);
//            }
//            
//            imageObj.imageData = data;
//            message.imageObject = imageObj;
//            
//            
//            WBSendMessageToWeiboRequest *request = [WBSendMessageToWeiboRequest requestWithMessage:message authInfo:authRequest access_token:self.wbtoken];
//            request.userInfo = @{@"share": @"DMShareSinaWeiboModule",
//                                 @"Other_Info_1": [NSNumber numberWithInt:123],
//                                 @"Other_Info_2": @[@"obj1", @"obj2"],
//                                 @"Other_Info_3": @{@"key1": @"obj1", @"key2": @"obj2"}};
//            //    request.shouldOpenWeiboAppInstallPageIfNotInstalled = NO;
//            [WeiboSDK sendRequest:request];
//            
//        }
//
//    }];
    
    UIImage *scaleImage = [self scaleToSize:[UIImage imageNamed:@"Icon"] size:CGSizeMake(160, 160)];
    NSData *data;
    if (UIImagePNGRepresentation(scaleImage) == nil) {
        data = UIImageJPEGRepresentation(scaleImage, 1);
    } else {
        data = UIImagePNGRepresentation(scaleImage);
    }

    imageObj.imageData = data;
    message.imageObject = imageObj;


    WBSendMessageToWeiboRequest *request = [WBSendMessageToWeiboRequest requestWithMessage:message authInfo:authRequest access_token:self.wbtoken];
    request.userInfo = @{@"share": @"DMShareSinaWeiboModule",
                         @"Other_Info_1": [NSNumber numberWithInt:123],
                         @"Other_Info_2": @[@"obj1", @"obj2"],
                         @"Other_Info_3": @{@"key1": @"obj1", @"key2": @"obj2"}};
    //    request.shouldOpenWeiboAppInstallPageIfNotInstalled = NO;
    [WeiboSDK sendRequest:request];
}

- (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [img drawInRect:CGRectMake(0,0, 160, 160)];
    // 从当前context中创建一个改变大小后的图片
    UIImage *imgae = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    //返回新的改变大小后的图片
    return imgae;
}



- (WBMessageObject *)messageToShare
{
    WBMessageObject *message = [WBMessageObject message];
    
    message.text = [NSString stringWithFormat:@"%@, %@", self.shareTextStr, self.shareUrl];

    WBImageObject *image = [WBImageObject object];
    
    NSData  *originData = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.shareImageUrl]];
    UIImage *originImage = [UIImage imageWithData:originData];
    UIImage *scaleImage = [self scaleToSize:originImage size:CGSizeMake(80, 80)];
    NSData *dataObj = nil;
    
    dataObj = UIImageJPEGRepresentation(scaleImage, 1.0);
    if (dataObj == nil) {
        dataObj = UIImagePNGRepresentation(scaleImage);
    }
    
    image.imageData = dataObj;
    
    
//    image.imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.shareImageUrl]];//[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"image_1" ofType:@"jpg"]];
    message.imageObject = image;
    
    
//    WBWebpageObject *webpage = [WBWebpageObject object];
//    webpage.objectID = @"dmall";
//    webpage.title = self.titleStr;
//    webpage.description = self.shareTextStr;//[NSString stringWithFormat:@"%@ %@",self.shareTextStr, self.shareUrl];//[NSString stringWithFormat:NSLocalizedString(@"分享网页内容简介-%.0f", nil), [[NSDate date] timeIntervalSince1970]];
//    webpage.thumbnailData = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.shareImageUrl]];//[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"image_2" ofType:@"jpg"]];
//    webpage.webpageUrl = self.shareUrl;
//    message.mediaObject = webpage;
    
    return message;
}


#pragma mark --
#pragma mark == WeiboSDKDelegate ==
#pragma mark --
- (void)didReceiveWeiboRequest:(WBBaseRequest *)request {
    
}


- (void)didReceiveWeiboResponse:(WBBaseResponse *)response {
//    NSString *title = NSLocalizedString(@"发送结果", nil);
//    NSString *message = [NSString stringWithFormat:@"%@: %d\n%@: %@\n%@: %@", NSLocalizedString(@"响应状态", nil), (int)response.statusCode, NSLocalizedString(@"响应UserInfo数据", nil), response.userInfo, NSLocalizedString(@"原请求UserInfo数据", nil),response.requestUserInfo];
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
//                                                    message:message
//                                                   delegate:nil
//                                          cancelButtonTitle:NSLocalizedString(@"确定", nil)
//                                          otherButtonTitles:nil];
    WBSendMessageToWeiboResponse* sendMessageToWeiboResponse = (WBSendMessageToWeiboResponse*)response;
    NSString* accessToken = [sendMessageToWeiboResponse.authResponse accessToken];
    if (accessToken)
    {
        self.wbtoken = accessToken;
    }
//    NSString* userID = [sendMessageToWeiboResponse.authResponse userID];
//    if (userID) {
//        self.wbCurrentUserID = userID;
//    }
//    [alert show];
//    [alert release];
}


@end
