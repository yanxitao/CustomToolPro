//
//  YZPickerView.h
//  yz-app
//
//  Created by 燕戏涛 on 16/3/31.
//  Copyright © 2016年 燕戏涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YZDateModel.h"

typedef NS_ENUM(NSInteger, YZPickerViewType) {
    
    YZDataPicker        = 0,
    YZDaysPicker,
    YZApplyTypePicker,
    YZAddressPicker
};

@class YZPickerView;
@protocol YZPickerViewDelegate <NSObject>

- (void)pickerViewDisappear:(id)sender;

@end

@interface YZPickerView : UIView<UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic)       UIPickerView                *myPickerView;
@property (strong, nonatomic)       UIView                      *topView;
@property (strong, nonatomic)       UILabel                     *topLable;
@property (weak, nonatomic)         id<YZPickerViewDelegate>    YZPickerDelegate;
@property (strong, nonatomic)       NSMutableArray              *listArr;
@property (strong, nonatomic)       YZDateModel                 *dateModel;
@property (assign, nonatomic)       NSInteger                   pickerRow0;
@property (assign, nonatomic)       NSInteger                   pickerRow1;
@property (assign, nonatomic)       NSInteger                   pickerRow2;
@property (assign, nonatomic)       NSInteger                   pickerRow3;

@property (strong, nonatomic)       NSString                    *timeStr;
@property (strong, nonatomic)       NSString                    *vacationTypeStr;
@property (strong, nonatomic)       NSString                    *vacationDayStr;
@property (strong, nonatomic)       NSString                    *restDayStr;
@property (strong, nonatomic)       NSString                    *zoneStr;
@property (strong, nonatomic)       NSString                    *streetStr;
@property (strong, nonatomic)       NSString                    *zoneAndStreetStr;
@property (assign, nonatomic)       NSInteger                   onCellType;

- (void)initPickerView:(YZPickerViewType) pickerType;
- (void)pickerSelectRes;

@end
