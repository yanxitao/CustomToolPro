//
//  YZApplyTypeVacationVC.h
//  yz-app
//
//  Created by 燕戏涛 on 16/3/29.
//  Copyright © 2016年 燕戏涛. All rights reserved.
//

#import "JKViewController.h"

@interface YZApplyTypeVacationVC : JKViewController

@property (assign, nonatomic)       BOOL            isCanEdite;
@property (assign, nonatomic)       BOOL            applyOrAudit;
@property (assign, nonatomic)       NSInteger       btnType;
@property (strong, nonatomic)       UIBarButtonItem *pickerOKBtn;

@end
