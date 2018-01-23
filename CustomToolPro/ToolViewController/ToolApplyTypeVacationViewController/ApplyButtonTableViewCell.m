//
//  ApplyButtonTableViewCell.m
//  yz-app
//
//  Created by 燕戏涛 on 16/3/30.
//  Copyright © 2016年 燕戏涛. All rights reserved.
//

#import "ApplyButtonTableViewCell.h"

@implementation ApplyButtonTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.confirmBtn.layer.cornerRadius = self.confirmBtn.width/2;
    self.confirmBtn.layer.masksToBounds = YES;
    self.auditCancelBtn.layer.cornerRadius = self.auditCancelBtn.width/2;
    self.auditConfirmBtn.layer.cornerRadius = self.auditConfirmBtn.width/2;
    
    self.backgroundColor = [UIColor colorWithString:@"#f3f6f9"];
}

- (void)showView:(YZBtnType)btnType{

    switch (btnType) {
        case YZOnlyBrowseBtnType:
            self.onlyBrowseView.hidden = NO;
            self.applyView.hidden = YES;
            self.attendanceView.hidden = YES;
            break;
            
        case YZApplyBtnType:
            self.onlyBrowseView.hidden = YES;
            self.applyView.hidden = NO;
            self.attendanceView.hidden = YES;
            break;
            
        case YZAttendanceBtnType:
            self.onlyBrowseView.hidden = YES;
            self.applyView.hidden = YES;
            self.attendanceView.hidden = NO;
            break;
            
        default:
            break;
    }
}

- (IBAction)confirmBtnAction:(id)sender {
    
    [self.applyButtonDelegate didConfirm:sender];
}

- (IBAction)cancelBtnAction:(id)sender {
    
    [self.applyButtonDelegate didCancel:sender];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
