//
//  YZDataModel.m
//  yz-app
//
//  Created by 燕戏涛 on 16/4/5.
//  Copyright © 2016年 燕戏涛. All rights reserved.
//

#import "YZDateModel.h"

@implementation YZDateModel

- (instancetype)init{

    self = [super init];
    if (self) {

//        self.yearsArr = [[NSArray alloc] initWithObjects:@"",@"",@"",@"",@"",, nil]
//        NSInteger num;
//        for (int i = 0; i < 100; i ++) {
//            num = 1995 + i;
//            [self.monthsArr addObject:[NSString stringWithFormat:@"%ld",(long)num]];
//        }
    }
    return self;
}

- (void)getPickerNeedDate {

    NSDate * nowDate = [NSDate date];
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY/MM/dd"];
    NSString * dateString = [dateFormatter stringFromDate:nowDate];
    NSLog(@"%@", dateString);
    
    NSArray * dateArr = [dateString componentsSeparatedByString:@"/"];
    NSLog(@"%@", dateArr);
    
    self.yearsStr = dateArr[0];
    self.monthStr = dateArr[1];
    self.daysStr = dateArr[2];
    
    NSString * preYear = [NSString stringWithFormat:@"%d", [self.yearsStr intValue] - 1];
    NSString * nextYear = [NSString stringWithFormat:@"%d", [self.yearsStr intValue] + 1];
    self.yearsArr = @[preYear,self.yearsStr,nextYear];
    self.monthsArr = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12"];
    self.daysArr = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31"];
    self.dayPartArr = @[@"上午",@"下午"];
    NSMutableArray * hoursArr = [[NSMutableArray alloc] init];
    for (int i = 0; i < 24; i ++) {
        if (i < 10) {
            [hoursArr addObject:[NSString stringWithFormat:@"0%d", i]];
        }else {
            [hoursArr addObject:[NSString stringWithFormat:@"%d", i]];
        }
    }
    self.hoursArr = [hoursArr copy];
    NSMutableArray * minutesArr = [[NSMutableArray alloc] init];
    for (int i = 0; i < 60; i ++) {
        if (i < 10) {
            [minutesArr addObject:[NSString stringWithFormat:@"0%d", i]];
        }else {
            [minutesArr addObject:[NSString stringWithFormat:@"%d", i]];
        }
    }
    self.minutesArr = [minutesArr copy];
    
    self.vacationTypeArr = @[@"事假",@"出差",@"调休",@"年假",@"产假",@"病假"];
    self.vacationDaysArr = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"];
    
    self.restDaysArr = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"];
    
    self.zoneArr = @[@"海淀",@"朝阳",@"东城",@"昌平",@"顺义",@"西城"];
    self.streetArr = @[@"街道1",@"街道2",@"街道3",@"街道4",@"街道5",@"街道6"];
    
    self.meettingLevelArr = @[@"一般",@"紧急",@"十万火急"];
    
}

- (void)getAuditTypeDate{

    self.auditTypeDic = [[NSMutableDictionary alloc] init];
    [self.auditTypeDic setValue:@"#ed960d" forKey:@"0"];
    [self.auditTypeDic setValue:@"#eb4141" forKey:@"1"];
    [self.auditTypeDic setValue:@"#5eba1a" forKey:@"2"];
    
    self.auditTypeDetailDic = [[NSMutableDictionary alloc] init];
    [self.auditTypeDetailDic setValue:@"待审核" forKey:@"0"];
    [self.auditTypeDetailDic setValue:@"通过" forKey:@"1"];
    [self.auditTypeDetailDic setValue:@"不通过" forKey:@"2"];
}

- (NSArray *)getCurrDaysWithMonth:(NSInteger)month year:(NSInteger)year{
    
    NSArray * bigMonthDayArrs = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31"];
    NSArray * smallMonthDayArrs = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30"];
    NSArray * bigFebDayArrs = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29"];
    NSArray * smallFebDayArrs = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28"];
    if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12) {
        self.daysArr = bigMonthDayArrs;
    }else if (month == 4 || month == 6 || month == 9 || month == 11) {
        self.daysArr = smallMonthDayArrs;
    }else if (month == 2 && year%4 == 0) {
        self.daysArr = bigFebDayArrs;
    }else if (month == 2 && year%4 != 0) {
        self.daysArr = smallFebDayArrs;
    }
    
    return self.daysArr;
}
@end
