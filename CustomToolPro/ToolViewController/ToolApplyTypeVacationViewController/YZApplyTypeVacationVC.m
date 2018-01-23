//
//  YZApplyTypeVacationVC.m
//  yz-app
//
//  Created by 燕戏涛 on 16/3/29.
//  Copyright © 2016年 燕戏涛. All rights reserved.
//

#import "YZApplyTypeVacationVC.h"
#import "ApplyOneTableViewCell.h"
#import "ApplyTwoTableViewCell.h"
#import "ApplyThreeTableViewCell.h"
#import "ApplyButtonTableViewCell.h"
#import "YZPickerView.h"

@interface YZApplyTypeVacationVC ()<UITableViewDelegate, UITableViewDataSource, YZPickerViewDelegate, ApplyButtonDelegate, ApplyOneTableDelegate>
{
    NSString                *timeLableStr;
    NSString                *vacationLableStr;
    NSString                *vacationDayStr;
    NSString                *causeStr;
    NSString                *totleVacationDay;
//    int                     applyTypeViewCount;
    int                     cellConut;
    int                     causeViewCount;
    BOOL                    isAddCauseView;
}

@property (weak, nonatomic) IBOutlet UITableView *applyTypeVacationTable;
@property (strong, nonatomic)       YZPickerView *pickerView;
//@property (strong, nonatomic)       YZApplyCauseView *applyCauseView;

@end

@implementation YZApplyTypeVacationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"请假申请";

//    applyTypeViewCount = 0;
    cellConut = 6;
    causeViewCount = 0;
    [self.view setBackgroundColor:[UIColor grayColor]];
    [self initTableView];
    [self initPickerView];
}

- (void)initPickerView{

    self.pickerView = [[YZPickerView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.pickerView.YZPickerDelegate = self;
    [self.view addSubview:self.pickerView];
    self.pickerView.hidden = YES;
    
    self.pickerOKBtn = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStyleDone target:self action:@selector(didPickerOKBtn)];
    self.navigationItem.rightBarButtonItem = nil;
}

- (void)initTableView{

    self.applyTypeVacationTable.delegate = self;
    self.applyTypeVacationTable.dataSource = self;
    
    [self.applyTypeVacationTable registerNib:[UINib nibWithNibName:@"ApplyOneTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellforApplyOne"];
    [self.applyTypeVacationTable registerNib:[UINib nibWithNibName:@"ApplyTwoTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellforApplyTwo"];
    [self.applyTypeVacationTable registerNib:[UINib nibWithNibName:@"ApplyThreeTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellforApplyThree"];
    [self.applyTypeVacationTable registerNib:[UINib nibWithNibName:@"ApplyButtonTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellforApplyButton"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return cellConut;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    NSInteger rowHerght;
    if (indexPath.row == 1) {
        return (65 * (causeViewCount + 1));
    }else if (indexPath.row >= cellConut - 2) {
        
        return 150;
    }else{

        return 65;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellforGroup"];
    
    if (indexPath.row < cellConut - 3 ) {
        
        ApplyOneTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellforApplyOne"];
//        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        if (!cell) {
            cell = [[ApplyOneTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellforApplyOne"];
        }
//        [cell setVacationTag:indexPath.row];
        [cell setVacationTag:indexPath.row causeViewCount:causeViewCount isAddCauseView:isAddCauseView causeStr:causeStr];
        cell.applyOneDelegate = self;
        cell.tag = indexPath.row + 1111;
        if (indexPath.row == 0 && timeLableStr) {
            cell.textLableValue.text = timeLableStr;
        }else if (indexPath.row == 1){
//            self.applyCauseView = [[YZApplyCauseView alloc] init];
//            [cell addSubview:self.applyCauseView];
        }
        else if (indexPath.row == cellConut - 5 && vacationLableStr) {
            cell.textLableValue.text = vacationLableStr;
        }else if (indexPath.row == cellConut - 4 && totleVacationDay) {
            cell.textLableValue.text = totleVacationDay;
        }

//        if (self.isCanEdite) {
//            cell.userInteractionEnabled = YES;
//        }else{
//            cell.userInteractionEnabled = NO;
//        }
        return cell;
    }else if (indexPath.row == cellConut - 3){
    
        ApplyTwoTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellforApplyTwo"];

        return cell;
    }else if (indexPath.row == cellConut - 2){
  
        ApplyThreeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellforApplyThree"];
//        if (self.isCanEdite) {
//            cell.userInteractionEnabled = YES;
//        }else{
//            cell.userInteractionEnabled = NO;
//        }
        return cell;
    }else{
    
        ApplyButtonTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellforApplyButton"];
        cell.applyButtonDelegate = self;
        cell.userInteractionEnabled = YES;
        if (self.btnType == YZOnlyBrowseBtnType) {
            [cell showView:YZOnlyBrowseBtnType];
        }else if (self.btnType == YZApplyBtnType) {
            [cell showView:YZApplyBtnType];
        }else if (self.btnType == YZAttendanceBtnType){
            [cell showView:YZAttendanceBtnType];
        }
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    return 0.1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.row == 0) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        self.pickerView.hidden = NO;
        self.navigationItem.rightBarButtonItem = self.pickerOKBtn;
        [self.pickerView initPickerView:YZDataPicker];
        
    }else if (indexPath.row == 1){
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
//        self.pickerView.hidden = NO;
//        self.navigationItem.rightBarButtonItem = self.pickerOKBtn;
//        [self.pickerView initPickerView:YZApplyTypePicker];
    }else if (indexPath.row == 2){
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}

- (void)didPickerOKBtn{

    [self.pickerView pickerSelectRes];
    //如果请假时间有值并且修改的是请假时间cell，对请假时间cell数据做处理
    if (self.pickerView.timeStr && self.pickerView.onCellType == 0) {
        timeLableStr = self.pickerView.timeStr;
        //只刷新第一行Cell,防止刷新全部导致类型cell添加条目重复
        [self.applyTypeVacationTable reloadRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:0 inSection:0], nil] withRowAnimation:UITableViewRowAnimationNone];
    }
    //如果请假类型条目有值并且修改的是请假条目cell，对请假条目cell数据做处理
    if (self.pickerView.vacationTypeStr && self.pickerView.onCellType == 1){
        vacationLableStr = self.pickerView.vacationTypeStr;
        vacationDayStr = self.pickerView.vacationDayStr;
        causeStr = [NSString stringWithFormat:@"%@  %@ 天", vacationLableStr, vacationDayStr];
//        applyTypeViewCount = applyTypeViewCount + 1;
        causeViewCount = causeViewCount + 1;
        totleVacationDay = [NSString stringWithFormat:@"%d", [totleVacationDay intValue] + [vacationDayStr intValue]];
        isAddCauseView = YES;
        [self.applyTypeVacationTable reloadData];
    }
    [self pickerViewDisappear:self.pickerView];
}

//picker代理方法
- (void)pickerViewDisappear:(id)sender{

    self.pickerView.hidden = YES;
    self.navigationItem.rightBarButtonItem = nil;

}

//applyOneTableViewCell代理方法（添加请假条目）
- (void)didAddCellBtn:(UIButton *)sender{

    self.pickerView.hidden = NO;
    self.navigationItem.rightBarButtonItem = self.pickerOKBtn;
    [self.pickerView initPickerView:YZApplyTypePicker];
}

//applyOneTableViewCell代理方法（删除请假条目）
- (void)didDeleteCellBtn:(UIButton *)sender didDeleteDay:(NSInteger)didDeleteDay{

    totleVacationDay = [NSString stringWithFormat:@"%ld", [totleVacationDay intValue] - didDeleteDay];
    
    causeViewCount = causeViewCount - 1;
    isAddCauseView = NO;
    
    [self.applyTypeVacationTable reloadData];
}

- (void)addApplyTypeView:(int)viewCount{

//    self.applyCauseView = [[YZApplyCauseView alloc] initWithFrame:CGRectMake(0, 65 * (viewCount - 1), SCREEN_WID, 65)];
//    [(ApplyOneTableViewCell *)[self.view viewWithTag:1112] addSubview:self.applyCauseView];
}

- (void)didConfirm:(id)sender{

    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didCancel:(id)sender{

    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
