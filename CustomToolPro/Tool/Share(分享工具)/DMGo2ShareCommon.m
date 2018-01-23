//
//  DMGo2ShareCommon.m
//  DMall
//
//  Created by 燕戏涛 on 15/10/21.
//  Copyright © 2015年 wintech. All rights reserved.
//
//


#import "DMGo2ShareCommon.h"
#import "DMShareBaseModule.h"
//#import "DMShareRequest.h"
//#import "DMShareResponse.h"
//#import "DMShareData.h"
#import "DMShareSheet.h"

@interface DMGo2ShareCommon () <DMShareSheetDelegate>

@property(nonatomic, assign) DMShareType        shareType;
@property(nonatomic, strong) NSString           *idString;
@property(nonatomic, strong) NSString           *sharePlatformStr;
@property(nonatomic, strong) DMShareSheet       *shareSheet;

@end

@implementation DMGo2ShareCommon

- (id) initWithShareType:(DMShareType)type  idString:(NSString *)idString shareWay:(NSArray *)shareWayArr{
    if (self = [super init]) {
        self.shareType = type;
        self.idString = idString;
        if(shareWayArr && [shareWayArr count] != 0 && [shareWayArr count] < 4){
            self.shareSheet = [[DMShareSheet alloc] initWithShareType:shareWayArr];
            [self.shareSheet setDMShareSheetDelegate:self];
        }else{
            self.shareSheet = [[DMShareSheet alloc] init];
            [self.shareSheet setDMShareSheetDelegate:self];
        }
        
    }
    return self;
}

- (void)showShareSheet:(UIView *)view{
    [self.shareSheet show:view];
}

#pragma mark - DMShareSheetDelegate
- (void) didTapBtn:(DMShareSheet *) view btnType:(DMShareSheetType) btnType {
    switch (btnType) {
        case DMShareSheetTypeWXSceneSession:
            _sharePlatformStr = SHAREPLATFORMWEIXIN;
            break;
        case DMShareSheetTypeWXSceneTimeline:
            _sharePlatformStr = SHAREPLATFORMWEIXINPY;
            break;
        case DMShareSheetTypeSinaWebo:
            _sharePlatformStr = SHAREPLATFORMWEIBO;
            break;
        default:
            break;
    }
    if (self.shareTitle && [self.shareTitle length] != 0 && self.shareImgUrl && [self.shareImgUrl length] != 0 && self.shareUrl && [self.shareUrl length] && self.shareInfo && [self.shareInfo length]) {
        [self realShareWithData];
    }else {
        [self fecthShareData:self.shareType sharePlatform:_sharePlatformStr shareId:self.idString];        
    }
}

- (void) fecthShareData :(DMShareType)shareType sharePlatform:(NSString *) sharePlatform shareId:(NSString *) shareId{

    _sharePlatformStr       = sharePlatform;
    NSString * shareTypeStr = nil; //= [NSString stringWithFormat:@"%ld",(long)shareType];
//    if (shareType == 0) {
//        shareTypeStr = SHARETYPEWAREDETAIL;
//    }else if (shareType == 1){
//        shareTypeStr = SHARETYPEPRODETAIL;
//    }else if (shareType == 2){
//        shareTypeStr = SHARETYPEPROAPP;
//    }else if (shareType == 3){
//        shareTypeStr = SHARETYPEWEBACTIVE;
//    }else if (shareType == 4){
//        shareTypeStr = SHARETYPEREDBAG;
//    }
    
//    [DMProgressHUD show];
//    DMShareRequest *request = [DMShareRequest new];
//    request.shareType = shareTypeStr;
//    request.sharePlatform = sharePlatform;
//    request.shareId = shareId;
//    request.timeoutInterval = 10.0f;
    __weak __typeof(self)weakSelf = self;
    
    [weakSelf realShareWithData];
}

- (void) realShareWithData {
    
    ShareModuleType  type = ShareModuleTypeWeChat;
    if ([_sharePlatformStr isEqualToString:SHAREPLATFORMWEIBO]) {
        type = ShareModuleTypeSinaWebo;
    }
    else if([_sharePlatformStr isEqualToString:SHAREPLATFORMWEIXIN]) {
        type = ShareModuleTypeWeChat;
    }
    else if ([_sharePlatformStr isEqualToString:SHAREPLATFORMWEIXINPY]) {
        type = ShareModuleTypeWeChat;
    }
    
    DMShareBaseModule   *shareModule = [DMShareBaseModule DMShareBaseModuleWithType:type];
//    [shareModule setShareTitleStr:self.shareTitle];
//    [shareModule setShareUrl:self.shareUrl];
//    [shareModule setShareTextStr:self.shareInfo];
//    [shareModule setShareImageUrl:self.shareImgUrl];
    [shareModule setShareTitleStr:self.shareTitle];
    [shareModule setShareUrl:self.shareUrl];
    [shareModule setShareTextStr:self.shareInfo? self.shareInfo : @""];
    [shareModule setShareImageUrl:self.shareImgUrl];
    if([_sharePlatformStr isEqualToString:SHAREPLATFORMWEIXINPY]) {
        [shareModule setIsWechatPy:YES];
    }
    [shareModule share];
}

@end
