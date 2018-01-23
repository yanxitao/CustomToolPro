//
//  ApplyOneTableViewCell.h
//  yz-app
//
//  Created by 燕戏涛 on 16/3/30.
//  Copyright © 2016年 燕戏涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ApplyOneTableViewCell;
@protocol ApplyOneTableDelegate <NSObject>

- (void)didAddCellBtn:(UIButton *)sender;
- (void)didDeleteCellBtn:(UIButton *)sender didDeleteDay:(NSInteger)didDeleteDay;

@end

@interface ApplyOneTableViewCell : UITableViewCell
@property (weak, nonatomic) id<ApplyOneTableDelegate> applyOneDelegate;
@property (weak, nonatomic) IBOutlet UILabel *nameLableValue;
@property (weak, nonatomic) IBOutlet UILabel *textLableValue;
@property (weak, nonatomic) IBOutlet UIView *lineView;
@property (weak, nonatomic) IBOutlet UIView *bizTripTypeView;
@property (weak, nonatomic) IBOutlet UIView *restTypeView;
@property (assign, nonatomic)       NSInteger           vacationTag;
@property (assign, nonatomic)       NSInteger           bizTripTag;
@property (assign, nonatomic)       NSInteger           restTag;
@property (weak, nonatomic) IBOutlet UIButton *vacationTypeBtn;
@property (weak, nonatomic) IBOutlet UIButton *overWorkTypeBtn;
@property (weak, nonatomic) IBOutlet UIButton *otherTypeBtn;
@property (weak, nonatomic) IBOutlet UIButton *overWorkRestTypeBtn;
@property (weak, nonatomic) IBOutlet UIButton *otherRestTypeBtn;
@property (weak, nonatomic) IBOutlet UIButton *addCellBtn;

@property (strong, nonatomic)       UILabel             *typeLable;
@property (assign, nonatomic)       NSInteger           vactaionDay;
@property (strong, nonatomic)       NSString            *typeLableValue;
@property (assign, nonatomic)       int                 currCauseViewCount;

@property (assign, nonatomic)       NSInteger           didDeleteDay;

- (void)setVacationTag:(NSInteger)vacationTag  causeViewCount:(NSInteger)causeViewCount isAddCauseView:(BOOL)isCauseView causeStr:(NSString *)causeStr;
@end
