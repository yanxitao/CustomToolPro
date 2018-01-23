//
//  DMGo2ShareCommon.h
//  DMall
//
//  Created by 燕戏涛 on 15/10/21.
//  Copyright © 2015年 wintech. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SHAREPLATFORMWEIXIN         @"WEIXIN"
#define SHAREPLATFORMWEIXINPY       @"WEIXINPY"
#define SHAREPLATFORMWEIBO          @"WEIBO"

///商详、订单详情、app、活动
typedef NS_ENUM(NSInteger, DMShareType) {
    DMShareTypeWarDetail = 0,
    DMShareTypeOrderDetail,
    DMShareTypeApp,
    DMShareTypeAcitvie,
    DMShareTypeRedBag
};

@interface DMGo2ShareCommon : UIViewController


@property(nonatomic,strong) NSString        *shareTitle;
@property(nonatomic,strong) NSString        *shareUrl;
@property(nonatomic,strong) NSString        *shareImgUrl;
@property(nonatomic,strong) NSString        *shareInfo;
@property (nonatomic, weak) NSArray         *shareWayArr;

- (void) fecthShareData :(DMShareType)shareType sharePlatform:(NSString *) sharePlatform shareId:(NSString *) shareId;

- (id) initWithShareType:(DMShareType)type  idString:(NSString *)idString shareWay:(NSArray *)shareWayArr;
- (void) showShareSheet:(UIView *)view;

@end
