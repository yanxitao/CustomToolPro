//
//  ToolMenuSixthViewController.m
//  CustomTool
//
//  Created by 燕戏涛 on 2017/10/31.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#import "ToolMenuFirstViewController.h"
#import "JKMenuView.h"
#import "ToolMenuSecondViewController.h"
#import "ToolMenuThirdViewController.h"
#import "ToolMenuFourthViewController.h"
#import "ToolMenuFifthViewController.h"
#import "ToolMenuSixthViewController.h"
#import "ViewController.h"

@interface ToolMenuSixthViewController ()<JKMenuViewDelegate>

{
    
    JKMenuView                              *menuView;
    
}

@end

@implementation ToolMenuSixthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.view setBackgroundColor:[UIColor blackColor]];

    UIButton * pieChartBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [pieChartBtn setFrame:CGRectMake(0, 0, 200, 50)];
    [pieChartBtn setCenter:CGPointMake(SCREEN_WID/2, SCREEN_HEI/2)];
    [pieChartBtn setTitle:@"侧边栏菜单" forState:UIControlStateNormal];
    [pieChartBtn setBackgroundColor:[UIColor grayColor]];
    pieChartBtn.layer.cornerRadius = 4;
    pieChartBtn.layer.masksToBounds = YES;
    [pieChartBtn addTarget:self action:@selector(initMenuView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pieChartBtn];

    UIButton * backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setFrame:CGRectMake(0, 0, 200, 50)];
    [backBtn setCenterY:(pieChartBtn.centerY + 70)];
    [backBtn setTitle:@"返回主页" forState:UIControlStateNormal];
    [backBtn setBackgroundColor:[UIColor grayColor]];
    backBtn.layer.cornerRadius = 4;
    backBtn.layer.masksToBounds = YES;
    [backBtn addTarget:self action:@selector(backBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];

}

//侧边栏菜单
- (void)initMenuView {
    
    menuView = [[JKMenuView alloc] init];
    menuView.menuViewDelegate = self;
    [menuView show];
    
}

//侧边栏菜单代理方法
- (void)menuItemSelected:(JKMenuItemType)menuItemType {
    
    ToolMenuFirstViewController * homeVC = [[ToolMenuFirstViewController alloc] init];
    
    ToolMenuSecondViewController * monthlyReportVC = [[ToolMenuSecondViewController alloc] init];
    
    ToolMenuThirdViewController * consumeOrderVC = [[ToolMenuThirdViewController alloc] init];
    
    ToolMenuFourthViewController * vipAppointmentVC = [[ToolMenuFourthViewController alloc] init];
    
    ToolMenuFifthViewController * cloudCardVC = [[ToolMenuFifthViewController alloc] init];
    
    ToolMenuSixthViewController * settingVC = [[ToolMenuSixthViewController alloc] init];
    
    UINavigationController * rootNavi;
    
    switch (menuItemType) {
        case JKTodayStateType:
            
            [self.navigationController pushViewController:homeVC animated:YES];
            
            rootNavi = [[UINavigationController alloc] initWithRootViewController:homeVC];
            [UIApplication sharedApplication].delegate.window.rootViewController = rootNavi;
            
            break;
            
        case JKMonthlyReportType:
            
            [self.navigationController pushViewController:monthlyReportVC animated:YES];
            
            rootNavi = [[UINavigationController alloc] initWithRootViewController:monthlyReportVC];
            [UIApplication sharedApplication].delegate.window.rootViewController = rootNavi;
            
            break;
            
        case JKConsumeOrderType:
            
            [self.navigationController pushViewController:consumeOrderVC animated:YES];
            
            rootNavi = [[UINavigationController alloc] initWithRootViewController:consumeOrderVC];
            [UIApplication sharedApplication].delegate.window.rootViewController = rootNavi;
            
            break;
            
        case JKVIPAppointmentType:
            
            [self.navigationController pushViewController:vipAppointmentVC animated:YES];
            
            rootNavi = [[UINavigationController alloc] initWithRootViewController:vipAppointmentVC];
            [UIApplication sharedApplication].delegate.window.rootViewController = rootNavi;
            
            break;
            
        case JKCloudCardType:
            
            [self.navigationController pushViewController:cloudCardVC animated:YES];
            
            rootNavi = [[UINavigationController alloc] initWithRootViewController:cloudCardVC];
            [UIApplication sharedApplication].delegate.window.rootViewController = rootNavi;
            
            break;
            
        case JKSettingType:
            
            [self.navigationController pushViewController:settingVC animated:YES];
            
            rootNavi = [[UINavigationController alloc] initWithRootViewController:settingVC];
            [UIApplication sharedApplication].delegate.window.rootViewController = rootNavi;
            
            break;
            
        default:
            break;
    }
}

- (void)backBtnAction {
    
    ViewController * VC = [[ViewController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
    
    UINavigationController * rootNavi = [[UINavigationController alloc] initWithRootViewController:VC];
    [UIApplication sharedApplication].delegate.window.rootViewController = rootNavi;
    
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
