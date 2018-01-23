//
//  JKMenuView.m
//  jk2cloud
//
//  Created by 燕戏涛 on 2017/9/8.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#import "JKMenuView.h"
#import "JKMenuItemCell.h"

@implementation JKMenuView
{
    
    UIView                  *_contentView;
    UIImage                 *bgImage;
    UIView                  *_bgView;
    UILabel                 *_titleValue;
    UILabel                 *_contentValue;
    UILabel                 *_versionValue;
    UILabel                 *_copyrightValue;
    UILabel                 *_developValue;
    UIButton                *_confirmBtn;
    UIView                  *_lineView;
    UITableView             *menuTableView;
    NSArray                 *menuItemsTitleArr;
    NSArray                 *menuItemsIconArr;
    UIButton                *settingBtn;

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        
        UITapGestureRecognizer * tapGestureRecogninzer = [[UITapGestureRecognizer alloc]
                                                          initWithTarget:self action:@selector(dismissAnimation)];
        
        menuItemsTitleArr = [[NSArray alloc] init];
        menuItemsTitleArr = @[@"今日状态",@"店铺月报",@"消费订单",@"会员预约",@"云集卡",@"设置"];

        menuItemsIconArr = [[NSArray alloc] init];
        menuItemsIconArr = @[@"todayStateItem_icon",@"monthlyReportItem_icon",@"consumeItem_icon",@"VIPAppointmentItem_icon",@"cloudCardItem_icon",@"settingItem_icon"];

        _bgView = [[UIView alloc] initWithFrame:self.bounds];
        [_bgView setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.4]];
        [_bgView addGestureRecognizer:tapGestureRecogninzer];
        [self addSubview:_bgView];
        
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(-220, 0, 220, SCREEN_HEI)];
        [_contentView setBackgroundColor:[UIColor colorWithString:@"#364350"]];
        [_contentView setUserInteractionEnabled:YES];
        [self addSubview:_contentView];
        
        menuTableView = [[UITableView alloc] init];
        [menuTableView setFrame:CGRectMake(0, 100, _contentView.width, _contentView.height - 200)];
        [menuTableView setDelegate:self];
        [menuTableView setDataSource:self];
        [menuTableView setBackgroundColor:[UIColor colorWithString:@"#364350"]];
        [menuTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [menuTableView registerNib:[UINib nibWithNibName:@"JKMenuItemCell" bundle:nil] forCellReuseIdentifier:@"cellOfMenuItem"];
        menuTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        [menuTableView setUserInteractionEnabled:YES];
        [_contentView addSubview:menuTableView];
        
        settingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [settingBtn setFrame:CGRectMake(0, _contentView.height - 50, _contentView.width, 50)];
        [settingBtn setBackgroundColor:[UIColor colorWithString:@"#399999"]];
        [settingBtn setImage:[UIImage imageNamed:@"settingItem_icon"] forState:UIControlStateNormal];
        [settingBtn setTitle:@"萧敬腾" forState:UIControlStateNormal];
        [settingBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [settingBtn addTarget:self action:@selector(settingBtnAction) forControlEvents:UIControlEventTouchUpInside];
        [_contentView addSubview:settingBtn];
        
    }
    
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return menuItemsTitleArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 55;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JKMenuItemCell * menuItemCell = [tableView dequeueReusableCellWithIdentifier:@"cellOfMenuItem"];
    if (menuItemCell == nil) {
        
        menuItemCell = [[JKMenuItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellOfMenuItem"];
    }
    [menuItemCell.itemIcon setImage:[UIImage imageNamed:menuItemsIconArr[indexPath.row]]];
    [menuItemCell.itemTitle setText:menuItemsTitleArr[indexPath.row]];
    [menuItemCell setSelectionStyle:UITableViewCellSelectionStyleDefault];
    
    return menuItemCell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.row == 0) {
        
        [self.menuViewDelegate menuItemSelected:JKTodayStateType];
    }else if (indexPath.row == 1) {
    
        [self.menuViewDelegate menuItemSelected:JKMonthlyReportType];
    }else if (indexPath.row == 2) {
        
        [self.menuViewDelegate menuItemSelected:JKConsumeOrderType];
    }else if (indexPath.row == 3) {
        
        [self.menuViewDelegate menuItemSelected:JKVIPAppointmentType];
    }else if (indexPath.row == 4) {
        
        [self.menuViewDelegate menuItemSelected:JKCloudCardType];
    }else if (indexPath.row == 5) {
        
        [self.menuViewDelegate menuItemSelected:JKSettingType];
    }
}

- (void)startAnimation {

    [UIView animateWithDuration:0.5 animations:^{
        
        [_contentView setLeft:0];
    } completion:^(BOOL finished){
        
//        [self startAnimation];
    }];

}

- (void)dismissAnimation {

    [UIView animateWithDuration:0.5 animations:^{
        
        [_contentView setLeft:-220];
        
        
    } completion:^(BOOL finished){
        
        [self dismiss];
    }];
    
}

- (void)show{
    
    UIWindow * keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:self];
    _bgView.alpha = 0.f;
    //    [_bgButton setImage:bgImage forState:UIControlStateNormal];
    //    [_bgButton setImage:bgImage forState:UIControlStateHighlighted];
    
//    _contentView.transform = CGAffineTransformMakeScale(1.1, 1.1);
    [UIView animateWithDuration:0.1 animations:^{
        
        _bgView.alpha = 1.f;
        _contentView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished){
        
        [self startAnimation];
    }];
    
}

- (void)settingBtnAction {

//    [self requestForLoginOut];
    [self.menuViewDelegate menuSetting];

}

- (void)requestForLoginOut {

//    [self.menuViewDelegate menuLoginOutPush];

//    JKLoginOutRequest * request = [[JKLoginOutRequest alloc] init];
//    
//    [[WHHttpClient shareInstance] connectWithRequest:request success:^(WHBaseResponse *response) {
//        
//        [self.menuViewDelegate menuLoginOutPush];
//        
//        [SVProgressHUD dismiss];
//        
//    } failure:^(WHBaseResponse *response) {
//        
//        [SVProgressHUD dismiss];
//    } error:^(NSError *error) {
//        
//        [SVProgressHUD dismiss];
//        //        [self.customCollectionView.mj_footer endRefreshing];
//        //        [self.customCollectionView.mj_header endRefreshing];
//        
//    }];

}

- (void)confirmBtnAction {
    
}

- (void)dismiss
{
    
    [UIView animateWithDuration:0.2 animations:^{
        _bgView.alpha = 0.f;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}

@end
