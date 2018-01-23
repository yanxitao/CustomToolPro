//
//  ToolPieChartViewController.m
//  CustomTool
//
//  Created by 燕戏涛 on 2017/10/31.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#import "ToolPieChartViewController.h"
#import "PiechartModel.h"
#import "PiechartDetchView.h"

@interface ToolPieChartViewController ()

@end

@implementation ToolPieChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    PiechartModel * model1 = [[PiechartModel alloc] init];
    model1.color = [UIColor colorWithString:@"#56a7ff"];
    model1.perStr = [NSString stringWithFormat:@"%f", 0.25];
    
    PiechartModel * model2 = [[PiechartModel alloc] init];
    model2.color = [UIColor colorWithString:@"#3ad7c8"];
    model2.perStr = [NSString stringWithFormat:@"%f", 0.25];
    
    PiechartModel * model3 = [[PiechartModel alloc] init];
    model3.color = [UIColor colorWithString:@"#fcd22a"];
    model3.perStr = [NSString stringWithFormat:@"%f", 0.25];
    
    PiechartModel * model4 = [[PiechartModel alloc] init];
    model4.color = [UIColor colorWithString:@"#5a7796"];
    model4.perStr = [NSString stringWithFormat:@"%f", 0.25];
    
    NSArray * pieChatArr = [NSArray arrayWithObjects:model1, model2, model3, model4, nil];
    
    PiechartDetchView * pieChat = [[PiechartDetchView alloc] initWithFrame:CGRectMake(SCREEN_WID/2 + 25, 40, 90, 90) withStrokeWidth:30 andColor:[UIColor whiteColor] andPerArray:pieChatArr andAnimation:YES];
    [self.view addSubview:pieChat];

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
