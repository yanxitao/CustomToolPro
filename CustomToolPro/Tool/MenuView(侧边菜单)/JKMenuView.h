//
//  JKMenuView.h
//  jk2cloud
//
//  Created by 燕戏涛 on 2017/9/8.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, JKMenuItemType) {
    
    JKTodayStateType = 0,
    JKMonthlyReportType,
    JKConsumeOrderType,
    JKVIPAppointmentType,
    JKCloudCardType,
    JKSettingType
    
};

@protocol JKMenuViewDelegate <NSObject>

- (void)menuItemSelected:(JKMenuItemType)menuItemType;
//- (void)menuLoginOutPush;
- (void)menuSetting;

@end

@interface JKMenuView : UIView<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) id<JKMenuViewDelegate>              menuViewDelegate;

- (void)show;
- (void)dismissAnimation;

@end
