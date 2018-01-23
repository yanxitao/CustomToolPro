//
//  YZDataModel.h
//  yz-app
//
//  Created by 燕戏涛 on 16/4/5.
//  Copyright © 2016年 燕戏涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YZDateModel : NSObject

@property (strong, nonatomic)       NSArray                 *yearsArr;
@property (strong, nonatomic)       NSArray                 *monthsArr;
@property (strong, nonatomic)       NSArray                 *daysArr;
@property (strong, nonatomic)       NSArray                 *dayPartArr;
@property (strong, nonatomic)       NSArray                 *hoursArr;
@property (strong, nonatomic)       NSArray                 *minutesArr;
@property (strong, nonatomic)       NSArray                 *meettingLevelArr;

@property (strong, nonatomic)       NSArray                 *vacationTypeArr;
@property (strong, nonatomic)       NSArray                 *vacationDaysArr;

@property (strong, nonatomic)       NSArray                 *restDaysArr;

@property (strong, nonatomic)       NSArray                 *zoneArr;
@property (strong, nonatomic)       NSArray                 *streetArr;

@property (strong, nonatomic)       NSString                *yearsStr;
@property (strong, nonatomic)       NSString                *monthStr;
@property (strong, nonatomic)       NSString                *daysStr;

@property (strong, nonatomic)       NSMutableDictionary     *auditTypeDic;
@property (strong, nonatomic)       NSMutableDictionary     *auditTypeDetailDic;

- (void)getPickerNeedDate;
- (void)getAuditTypeDate;
- (NSArray *)getCurrDaysWithMonth:(NSInteger)month year:(NSInteger)year;

@end
