//
//  ApplyOneTableViewCell.m
//  yz-app
//
//  Created by 燕戏涛 on 16/3/30.
//  Copyright © 2016年 燕戏涛. All rights reserved.
//

#import "ApplyOneTableViewCell.h"

@implementation ApplyOneTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
    self.backgroundColor = [UIColor colorWithString:@"#f3f6f9"];
}

- (void)drawRect:(CGRect)rect{

    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextFillRect(context, rect);
    
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithString:@"#999999"].CGColor);
    CGContextStrokeRect(context, CGRectMake(30, rect.size.height - 0.5, rect.size.width - 60, 0.5));
}

- (void)setVacationTag:(NSInteger)vacationTag causeViewCount:(NSInteger)causeViewCount isAddCauseView:(BOOL)isCauseView causeStr:(NSString *)causeStr{

    self.currCauseViewCount = (int)causeViewCount;
    switch (vacationTag) {
        case 0:
            self.nameLableValue.text = @"时间";
            self.textLableValue.text = @"请选择时间";
            break;
            
        case 1:
            self.nameLableValue.text = @"类型";
            //            self.textLableValue.text = @"";
            self.textLableValue.hidden = YES;
            self.addCellBtn.hidden = NO;
            if (causeViewCount > 0 && isCauseView == YES) {
                UIView * causeView = [[UIView alloc] init];
                [causeView setFrame:CGRectMake(0, 65 * (causeViewCount - 1), self.width, 65)];
                [causeView setBackgroundColor:[UIColor clearColor]];
                [causeView setTag:causeViewCount + 1220];
                [self addSubview:causeView];
                
                UILabel * causeLabel = [[UILabel alloc] init];
//                self.typeLable = [[UILabel alloc] init];
                [causeLabel setFrame:CGRectMake(80, 0, self.width - 160, 64)];
                [causeLabel setText:causeStr];
                [causeLabel setTextAlignment:NSTextAlignmentRight];
                [causeLabel setTag:causeViewCount + 3220];
                [causeView addSubview:causeLabel];
                
                UIButton * deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
                [deleteBtn setFrame:CGRectMake(self.width - 70, 13, 40, 40)];
                [deleteBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
                [deleteBtn setImage:[UIImage imageNamed:@"deleteCauseViewBtn"] forState:UIControlStateNormal];
                [deleteBtn setImage:[UIImage imageNamed:@"deleteCauseViewBtn"] forState:UIControlStateHighlighted];
//                    [deleteBtn setBackgroundColor:[UIColor grayColor]];
                [deleteBtn setTag:causeViewCount + 2220];
                [deleteBtn addTarget:self action:@selector(didDeleteBtn:) forControlEvents:UIControlEventTouchUpInside];
                [causeView addSubview:deleteBtn];
                
                UIView * lineView = [[UIView alloc] init];
                [lineView setFrame:CGRectMake(80, 64.5, self.width - 120, 0.5)];
                [lineView setBackgroundColor:[UIColor grayColor]];
                [causeView addSubview:lineView];
                
                self.vactaionDay = 3;
            }
            break;
            
        case 2:
            self.nameLableValue.text = @"天数";
            self.textLableValue.text = @"天";
            break;
            
        case 3:
            self.nameLableValue.text = @"事由";
            self.lineView.hidden = YES;
            break;
            
        default:
            break;
    }
}

- (void)setBizTripTag:(NSInteger)bizTripTag{

    switch (bizTripTag) {
        case 0:
            self.nameLableValue.text = @"时间";
            self.textLableValue.text = @"请选择时间";
            break;
        case 1:
            self.nameLableValue.text = @"出差人员";
            self.textLableValue.text = @"请选择";
            break;
//            
//        case 2:
//            self.nameLableValue.text = @"出差类型";
//            self.bizTripTypeView.hidden = NO;
//            break;
            
        case 2:
            self.nameLableValue.text = @"出差地点";
            self.textLableValue.text = @"请选择";
            break;
            
        case 3:
            self.nameLableValue.text = @"调休天数";
            self.textLableValue.text = @"请选择";
            break;
            
        case 4:
            self.nameLableValue.text = @"事由";
            self.lineView.hidden = YES;
            break;
            
        default:
            break;
    }
}

- (void)setRestTag:(NSInteger)restTag{

    switch (restTag) {
        case 0:
            self.nameLableValue.text = @"开始时间";
            self.textLableValue.text = @"请选择";
            break;
            
        case 1:
            self.nameLableValue.text = @"调休人员";
            self.textLableValue.text = @"请选择";
            break;
            
        case 2:
            self.nameLableValue.text = @"调休事由";
            self.restTypeView.hidden = NO;
            break;
            
        case 3:
            self.nameLableValue.text = @"调休天数";
            self.textLableValue.text = @"请选择";
            break;
            
        case 4:
            self.nameLableValue.text = @"备注信息";
            self.lineView.hidden = YES;
            break;
            
        default:
            break;
    }
}

- (void)reloadCauseView:(NSInteger)currTag{

    for (int i = (int)currTag ; i < 1221 + self.currCauseViewCount; i ++) {
        [[self viewWithTag:i + 1] setFrame:CGRectMake(0, 65 * (i - 1221), self.width, 65)];
        [self viewWithTag:i + 1].tag = [self viewWithTag:i + 1].tag - 1;
        [self viewWithTag:i + 1 + 1000].tag = [self viewWithTag:i + 1 + 1000].tag - 1;
        [self viewWithTag:i + 1 + 2000].tag = [self viewWithTag:i + 1 + 2000].tag - 1;
    }
}

- (IBAction)didTypeBtn:(id)sender {
    
    if (self.bizTripTypeView.hidden == NO) {
        NSLog(@"%@", sender);
        self.vacationTypeBtn.selected = NO;
        self.overWorkTypeBtn.selected = NO;
        self.otherTypeBtn.selected = NO;
    }
    if (self.restTypeView.hidden == NO) {
        self.overWorkRestTypeBtn.selected = NO;
        self.otherRestTypeBtn.selected = NO;
    }
    
    [(UIButton *)sender setSelected:YES];
}

- (IBAction)didAddBtn:(id)sender {
    [self.applyOneDelegate didAddCellBtn:sender];
}

- (void)didDeleteBtn:(id)sender {

//    self.didDeleteDayStr = [self viewWithTag:((UIButton *)sender).tag - 1000];
    NSString * didDeleteStr = ((UILabel *)[self viewWithTag:((UIButton *)sender).tag + 1000]).text;
    NSScanner * scanner = [NSScanner scannerWithString:didDeleteStr];
    [scanner scanUpToCharactersFromSet:[NSCharacterSet decimalDigitCharacterSet] intoString:nil];
    int number;
    [scanner scanInt:&number];
    self.didDeleteDay = number;
    
    [[self viewWithTag:((UIButton *)sender).tag - 1000] removeFromSuperview];
    self.currCauseViewCount = self.currCauseViewCount - 1;
    [self reloadCauseView:((UIButton *)sender).tag - 1000];
    [self.applyOneDelegate didDeleteCellBtn:sender didDeleteDay:self.didDeleteDay];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
