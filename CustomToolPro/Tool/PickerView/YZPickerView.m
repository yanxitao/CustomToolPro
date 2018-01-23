//
//  YZPickerView.m
//  yz-app
//
//  Created by 燕戏涛 on 16/3/31.
//  Copyright © 2016年 燕戏涛. All rights reserved.
//

#import "YZPickerView.h"
#import "YZDateModel.h"

@class myPickerView;

@interface YZPickerView ()
{

    NSInteger           tempYear;
    NSInteger           tempMonth;
}

@end

@implementation YZPickerView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    
    UIView * middleView = [[UIView alloc] initWithFrame:self.bounds];
    middleView.backgroundColor = [UIColor blackColor];
    middleView.alpha = 0.3;
    [self addSubview:middleView];
  
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pickerDisappear:)];
    [self addGestureRecognizer:tap];

    return self;
}

- (void)initPickerView:(YZPickerViewType)pickerType{

    switch (pickerType) {
        case YZDataPicker:
            [self initDataPickerView];
            break;
           
        case YZDaysPicker:
            [self initDaysPickerView
             ];
            break;
            
        case YZApplyTypePicker:
            [self initApplyTypePickerView];
            break;
            
        case YZAddressPicker:
            [self initAddressPickerView];
            break;
            
        default:
            break;
    }

}

- (void)initDataPickerView{

    self.dateModel = [[YZDateModel alloc] init];
    [self.dateModel getPickerNeedDate];
    tempMonth = [self.dateModel.monthStr intValue];
    
    self.topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WID, 30)];
    self.topView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.topView];
    
    self.myPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 30, SCREEN_WID, 220)];
    self.myPickerView.delegate = self;
    self.myPickerView.dataSource = self;
    self.myPickerView.tag = 1001;
    self.myPickerView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.myPickerView];
    
    NSArray * dataArr = @[@"年",@"月",@"日",@"时段"];
    
    for (int i = 0; i < 4; i ++) {
        self.topLable = [[UILabel alloc] init];
        [self.topLable setFrame:CGRectMake(SCREEN_WID / 4 * i, 0, SCREEN_WID/4, 30)];
        [self.topLable setText:dataArr[i]];
//        [self.topLable setFont:[UIFont systemFontOfSize:16]];
        [self.topLable setTextAlignment:NSTextAlignmentCenter];
        [self.topView addSubview:self.topLable];
    }
    int currMonth = [self.dateModel.monthStr intValue] - 1;
    int currDay = [self.dateModel.daysStr intValue] - 1;
    [self.myPickerView selectRow:1 inComponent:0 animated:YES];
    [self.myPickerView selectRow:currMonth inComponent:1 animated:YES];
    [self.myPickerView selectRow:currDay inComponent:2 animated:YES];
    
    self.pickerRow0 = 1;
    self.pickerRow1 = currMonth;
    self.pickerRow2 = currDay;
    self.pickerRow3 = 0;
}

- (void)initApplyTypePickerView{
    
    self.dateModel = [[YZDateModel alloc] init];
    [self.dateModel getPickerNeedDate];
    self.topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WID, 30)];
    self.topView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.topView];
    
    self.myPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 30, SCREEN_WID, 220)];
    self.myPickerView.delegate = self;
    self.myPickerView.dataSource = self;
    self.myPickerView.tag = 1002;
    self.myPickerView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.myPickerView];
    
    NSArray * dataArr = @[@"类型",@"天数"];

    for (int i = 0; i < 2; i ++) {
        self.topLable = [[UILabel alloc] init];
        [self.topLable setFrame:CGRectMake(SCREEN_WID / 2 * i, 0, SCREEN_WID/2, 30)];
        [self.topLable setText:dataArr[i]];
        [self.topLable setTextAlignment:NSTextAlignmentCenter];
        [self.topView addSubview:self.topLable];
    }
    
    self.pickerRow0 = 0;
    self.pickerRow1 = 0;
}

- (void)initDaysPickerView{
    
    self.dateModel = [[YZDateModel alloc] init];
    [self.dateModel getPickerNeedDate];
    self.topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WID, 30)];
    self.topView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.topView];
    
    self.myPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 30, SCREEN_WID, 220)];
    self.myPickerView.delegate = self;
    self.myPickerView.dataSource = self;
    self.myPickerView.tag = 1003;
    self.myPickerView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.myPickerView];
    
    self.topLable = [[UILabel alloc] init];
    [self.topLable setFrame:CGRectMake( 0, 0, SCREEN_WID, 30)];
    [self.topLable setText:@"天数"];
    [self.topLable setTextAlignment:NSTextAlignmentCenter];
    [self.topView addSubview:self.topLable];
    
    self.pickerRow0 = 0;
}

- (void)initAddressPickerView{
    
    self.dateModel = [[YZDateModel alloc] init];
    [self.dateModel getPickerNeedDate];
    self.topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WID, 30)];
    self.topView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.topView];
    
    self.myPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 30, SCREEN_WID, 220)];
    self.myPickerView.delegate = self;
    self.myPickerView.dataSource = self;
    self.myPickerView.tag = 1004;
    self.myPickerView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.myPickerView];
    
    NSArray * dataArr = @[@"区县",@"街道"];
    
    for (int i = 0; i < 2; i ++) {
        self.topLable = [[UILabel alloc] init];
        [self.topLable setFrame:CGRectMake(SCREEN_WID / 2 * i, 0, SCREEN_WID/2, 30)];
        [self.topLable setText:dataArr[i]];
        [self.topLable setTextAlignment:NSTextAlignmentCenter];
        [self.topView addSubview:self.topLable];
    }
    self.pickerRow0 = 0;
    self.pickerRow1 = 0;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{

    NSInteger itemNum;
    if (pickerView.tag == 1001) {
        itemNum = 4;
    }else if (pickerView.tag == 1002) {
        itemNum = 2;
    }else if (pickerView.tag == 1003) {
        itemNum = 1;
    }else{
        itemNum = 2;
    }
    return itemNum;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{

    NSInteger itemNum;
    if (pickerView.tag == 1001) {
        if (component == 0) {
            itemNum = 3;
        }else if (component == 1){
            itemNum = 12;
        }else if (component == 2){
            itemNum = [self.dateModel getCurrDaysWithMonth:tempMonth year:tempYear].count;
        }else{
            itemNum = 2;
        }
    }else if (pickerView.tag == 1002) {
        if (component == 0) {
            itemNum = 6;
        }else{
            itemNum = 10;
        }
    }else if (pickerView.tag == 1003) {
        itemNum = 10;
    }else {
        if (component == 0) {
            itemNum = 6;
        }else{
            itemNum = 6;
        }
    }
    return itemNum;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{

//    self.yearsArr = @[@"",@""];
//    NSArray * arrs = [[NSArray alloc] init];
    NSString * itemStr;
    NSArray * tempArrs = [[NSArray alloc] init];
    if (pickerView.tag == 1001) {
        if (component == 0) {
            tempArrs = self.dateModel.yearsArr;
            [self.listArr removeAllObjects];
            self.listArr = [NSMutableArray arrayWithArray:tempArrs];
            itemStr = self.listArr[row];
        }else if (component == 1) {
            tempArrs = self.dateModel.monthsArr;
            [self.listArr removeAllObjects];
            self.listArr = [NSMutableArray arrayWithArray:tempArrs];
            itemStr = self.listArr[row];
        }else if (component == 2) {
            tempArrs = [self.dateModel getCurrDaysWithMonth:tempMonth year:tempYear];
            [self.listArr removeAllObjects];
            self.listArr = [NSMutableArray arrayWithArray:tempArrs];
            if (row > self.listArr.count - 1) {
                row = self.listArr.count - 1;
            }
            itemStr = self.listArr[row];
        }else {
            tempArrs = self.dateModel.dayPartArr;
            [self.listArr removeAllObjects];
            self.listArr = [NSMutableArray arrayWithArray:tempArrs];
            itemStr = self.listArr[row];
        }

    }else if (pickerView.tag == 1002) {
        if (component == 0) {
            tempArrs = self.dateModel.vacationTypeArr;
            [self.listArr removeAllObjects];
            self.listArr = [NSMutableArray arrayWithArray:tempArrs];
            itemStr = self.listArr[row];
        }else{
            tempArrs = self.dateModel.vacationDaysArr;
            [self.listArr removeAllObjects];
            self.listArr = [NSMutableArray arrayWithArray:tempArrs];
            itemStr = self.listArr[row];
        }
    }else if (pickerView.tag == 1003) {
        tempArrs = self.dateModel.restDaysArr;
        [self.listArr removeAllObjects];
        self.listArr = [NSMutableArray arrayWithArray:tempArrs];
        itemStr = self.listArr[row];
    }else {
        if (component == 0) {
            tempArrs = self.dateModel.zoneArr;
            [self.listArr removeAllObjects];
            self.listArr = [NSMutableArray arrayWithArray:tempArrs];
            itemStr = self.listArr[row];
        }else{
            tempArrs = self.dateModel.streetArr;
            [self.listArr removeAllObjects];
            self.listArr = [NSMutableArray arrayWithArray:tempArrs];
            itemStr = self.listArr[row];
        }
    }
    return itemStr;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{

    if (pickerView.tag == 1001) {
        if (component == 0) {
            self.pickerRow0 = row;
            tempYear = [self.dateModel.yearsArr[row] intValue];

//            [self.myPickerView selectRow:1 inComponent:0 animated:YES];
//            [pickerView reloadAllComponents];
        }else if (component == 1) {
            self.pickerRow1 = row;
            tempMonth = [self.dateModel.monthsArr[row] intValue];
            [self.myPickerView reloadComponent:2];
            if (self.pickerRow2 > ([self.dateModel getCurrDaysWithMonth:tempMonth year:tempYear].count - 1)) {
                [self.myPickerView selectRow:([self.dateModel getCurrDaysWithMonth:tempMonth year:tempYear].count - 1) inComponent:2 animated:YES];
                
                self.pickerRow2 = ([self.dateModel getCurrDaysWithMonth:tempMonth year:tempYear].count - 1);
            }
//            [self.myPickerView selectRow:2 inComponent:1 animated:YES];
        }else if (component == 2) {
            self.pickerRow2 = row;
//            [self.myPickerView selectRow:2 inComponent:2 animated:YES];
        }else {
            self.pickerRow3 = row;
        }
    }else if (pickerView.tag == 1002) {
        if (component == 0) {
            self.pickerRow0 = row;
        }else {
            self.pickerRow1 = row;
        }
    }else if (pickerView.tag == 1003) {
        self.pickerRow0 = row;
    }else {
        if (component == 0) {
            self.pickerRow0 = row;
        }else {
            self.pickerRow1 = row;
        }
    }
}

- (void)pickerSelectRes{

    if (self.myPickerView.tag == 1001) {
        NSString * yearStr = self.dateModel.yearsArr[self.pickerRow0];
//        NSString * monthStr = self.dateModel.monthsArr[self.pickerRow1];
        NSString * monthStr;
        if ([self.dateModel.monthsArr[self.pickerRow1] intValue] < 10) {
            monthStr = [NSString stringWithFormat:@"0%@", self.dateModel.monthsArr[self.pickerRow1]];
        }else {
            monthStr = self.dateModel.monthsArr[self.pickerRow1];
        }
//        NSString * dayStr = self.dateModel.daysArr[self.pickerRow2];
        NSString * dayStr;
        if ([self.dateModel.daysArr[self.pickerRow2] intValue] < 10) {
            dayStr = [NSString stringWithFormat:@"0%@", self.dateModel.daysArr[self.pickerRow2]];
        }else {
            dayStr = self.dateModel.daysArr[self.pickerRow2];
        }
        NSString * dayPartStr = self.dateModel.dayPartArr[self.pickerRow3];
        self.timeStr = [NSString stringWithFormat:@"%@年%@月%@日   %@",yearStr,monthStr,dayStr,dayPartStr];
        NSLog(@"%@", self.timeStr);
        self.onCellType = 0;
    }else if (self.myPickerView.tag == 1002) {
        self.vacationTypeStr = self.dateModel.vacationTypeArr[self.pickerRow0];
        self.vacationDayStr = self.dateModel.vacationDaysArr[self.pickerRow1];
        self.onCellType = 1;
    }else if (self.myPickerView.tag == 1003) {
        self.restDayStr = self.dateModel.restDaysArr[self.pickerRow0];
    }else {
        self.zoneStr = self.dateModel.zoneArr[self.pickerRow0];
        self.streetStr = self.dateModel.streetArr[self.pickerRow1];
        self.zoneAndStreetStr = [NSString stringWithFormat:@"%@  %@",self.zoneStr,self.streetStr];
    }
}

- (void)pickerDisappear:(id)sender{
    
    [self.YZPickerDelegate pickerViewDisappear:sender];
}

@end
