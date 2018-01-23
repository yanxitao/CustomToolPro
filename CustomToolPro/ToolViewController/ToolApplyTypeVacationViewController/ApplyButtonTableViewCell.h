//
//  ApplyButtonTableViewCell.h
//  yz-app
//
//  Created by 燕戏涛 on 16/3/30.
//  Copyright © 2016年 燕戏涛. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, YZBtnType) {
    
    YZOnlyBrowseBtnType        =0,              //只浏览
    YZApplyBtnType,                             //申请
    YZAttendanceBtnType                         //审核
};

@class ApplyButtonTableViewCell;
@protocol ApplyButtonDelegate <NSObject>

- (void)didConfirm:(id)sender;
- (void)didCancel:(id)sender;

@end

@interface ApplyButtonTableViewCell : UITableViewCell

@property (weak, nonatomic) id<ApplyButtonDelegate>     applyButtonDelegate;
@property (weak, nonatomic) IBOutlet UIView *onlyBrowseView;
@property (weak, nonatomic) IBOutlet UIView *attendanceView;
@property (weak, nonatomic) IBOutlet UIView *applyView;
@property (weak, nonatomic) IBOutlet UIButton *confirmBtn;
@property (weak, nonatomic) IBOutlet UIButton *auditConfirmBtn;
@property (weak, nonatomic) IBOutlet UIButton *auditCancelBtn;

- (void)showView:(YZBtnType)btnType;

@end
