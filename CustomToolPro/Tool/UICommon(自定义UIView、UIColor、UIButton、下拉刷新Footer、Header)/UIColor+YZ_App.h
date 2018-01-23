//
//  UIColor+YZ_App.h
//  yz-app
//
//  Created by 燕戏涛 on 16/3/18.
//  Copyright © 2016年 燕戏涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+YZExtension.h"

@interface UIColor (YZ_App)

//下划线也颜色
+ (UIColor *) appUnderline;

//tabbar背景色
+ (UIColor *) appTabBarBottom;

//深色文字
+ (UIColor *) appDarkValue;

//浅色文字
+ (UIColor *) appShallowValue;

//左边竖线
+ (UIColor *) appLeftVerticalBar;

//会议主色
+ (UIColor *) appMeettingMain;

//工作历主色
+ (UIColor *) appCalendarMain;

//通讯录主色
+ (UIColor *) appColleagueMain;

//cell背景色
+ (UIColor *) appCellBGColor;

//通讯录所属单位主色
+ (UIColor *) appColleaguePortionMain;

//通讯录所属单位按钮
+ (UIColor *) appColleaguePortionBtn;
@end
