//
//  JKCommonModel.h
//  jk2cloud
//
//  Created by 燕戏涛 on 2017/9/25.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JKCommonModel : NSObject

+ (NSString *)getiPhoneName;// 获取iPhone名称
+ (NSString *)getAPPVerion;// 获取app版本号
+ (CGFloat)getBatteryLevel;// 获取电池电量
+ (NSString *)getSystemName;// 当前系统名称
+ (NSString *)getSystemVersion;// 当前系统版本号
+ (NSString *)getUUID;// 通用唯一识别码UUID
+ (long long)getTotalMemorySize;// 获取总内存大小
+ (NSString *)getDeviceIPAdress;// 获取当前设备IP
+ (long long)getAvailableMemorySize;// 获取当前可用内存
+ (CGFloat)getCurrentBatteryLevel;// 获取精准电池电量
+ (NSString *) getBatteryState;// 获取电池当前的状态，共有4种状态
+ (NSString *)getDeviceLanguage;// 获取当前语言

+ (NSString *)handleDateStringToStringOfOrderList:(NSDate *)currDate;
+ (NSString *)handleDateStringToStringOfDay:(NSString *)currDateString;
+ (NSString *)handleDateStringToStringOfMonthlyReport:(NSDate *)currDate;

@end
