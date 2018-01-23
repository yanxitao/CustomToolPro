//
//  ViewController.m
//  CustomTool
//
//  Created by 燕戏涛 on 2017/10/30.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#import "ViewController.h"
#import "PiechartModel.h"
#import "PiechartDetchView.h"
#import "ToolPieChartViewController.h"
#import "ToolSegmentViewController.h"
#import "ToolMenuFirstViewController.h"
#import "YZApplyTypeVacationVC.h"
#import "ToolCALayerAnimationViewController.h"
#import "TestForNetWorksGroupViewController.h"
#import "AlgorithmTestViewController.h"
#import "CategoryAndExtensionTestViewController.h"
#import "TableViewTestViewController.h"
#import "JSInteractiveiOSViewController.h"
#import "JSPatchTestViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong)           UITableView                         *myTableView;
@property (nonatomic, strong)           NSArray                             *cellTitleArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //    [self.view setBackgroundColor:[UIColor yellowColor]];
    
    self.cellTitleArr = @[@"统计图",@"分段控制器",@"侧边菜单栏",@"pickerView",@"layer动画",@"多请求（信号量）处理",@"算法测试",@"分类扩展测试",@"tableview重用问题",@"JS&iOS交互",@"JSPatch热修改"];
    
    [self initWithTableView];
    
}

- (void)initWithTableView {
    
    self.myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WID, SCREEN_HEI) style:UITableViewStylePlain];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.separatorColor = [UIColor colorWithString:@"0x999999"];
    [self.view addSubview:self.myTableView];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.cellTitleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        cell.textLabel.text = self.cellTitleArr[indexPath.row];
        cell.textLabel.textColor = [UIColor blackColor];
        
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case 0:
            //跳转统计图
            [self pushToPieChartVC];
            break;
            
        case 1:
            //跳转分段控制器
            [self pushToSegmentVC];
            break;
            
        case 2:
            //跳转侧边栏菜单
            [self pushToMenuVC];
            break;
            
        case 3:
            //跳转pickerView
            [self pushToPickerVC];
            break;
            
        case 4:
            //跳转layerAnimationView
            [self pushToLayerAnimationVC];
            break;
            
        case 5:
            //跳转TestForNetWorksGroupView
            [self pushToTestForNetWorksGroupVC];
            break;
            
        case 6:
            //跳转pushToAlgorithmTestView
            [self pushToAlgorithmTestVC];
            break;
            
        case 7:
            //跳转pushToAlgorithmTestView
            [self pushToCategoryAndExtensionTestVC];
            break;
            
        case 8:
            //跳转tableviewcell复用问题view
            [self pushToTableViewTestVC];
            break;
            
        case 9:
            //跳转JS&iOS交互页面
            [self pushToJSInteractiveiOSVC];
            break;
            
        case 10:
            //跳转JSPatch热修改页面
            [self pushToJSPatchTestVC];
            break;
            
        default:
            break;
    }
}

//跳转统计图
- (void)pushToPieChartVC {
    
    ToolPieChartViewController * toolPieChartVC = [[ToolPieChartViewController alloc] init];
    [self.navigationController pushViewController:toolPieChartVC animated:YES];
}

//跳转分段控制器
- (void)pushToSegmentVC {
    
    ToolSegmentViewController * toolSegmentVC = [[ToolSegmentViewController alloc] init];
    [self.navigationController pushViewController:toolSegmentVC animated:YES];
}

//跳转侧边栏菜单
- (void)pushToMenuVC {
    
    ToolMenuFirstViewController * toolMenuVC = [[ToolMenuFirstViewController alloc] init];
    [self.navigationController pushViewController:toolMenuVC animated:YES];
}

//跳转pickerView
- (void)pushToPickerVC {
    
    YZApplyTypeVacationVC * toolPickerVC = [[YZApplyTypeVacationVC alloc] init];
    [self.navigationController pushViewController:toolPickerVC animated:YES];
}

//跳转layerAnimationView
- (void)pushToLayerAnimationVC {
    
    ToolCALayerAnimationViewController * toolCALayerVC = [[ToolCALayerAnimationViewController alloc] init];
    [self.navigationController pushViewController:toolCALayerVC animated:YES];
}

//跳转TestForNetWorksGroupView
- (void)pushToTestForNetWorksGroupVC {
    
    TestForNetWorksGroupViewController * netWorksGroupVC = [[TestForNetWorksGroupViewController alloc] init];
    [self.navigationController pushViewController:netWorksGroupVC animated:YES];
}

//跳转pushToAlgorithmTestView
- (void)pushToAlgorithmTestVC {
    
    AlgorithmTestViewController * algorithmTestVC = [[AlgorithmTestViewController alloc] init];
    [self.navigationController pushViewController:algorithmTestVC animated:YES];
}

//跳转分类扩展View
- (void)pushToCategoryAndExtensionTestVC {
    
    CategoryAndExtensionTestViewController * ateAndExtVC = [[CategoryAndExtensionTestViewController alloc] init];
    [self.navigationController pushViewController:ateAndExtVC animated:YES];
}

//跳转tableviewcell复用问题view
- (void)pushToTableViewTestVC {
    
    TableViewTestViewController * tableViewTestVC = [[TableViewTestViewController alloc] init];
    [self.navigationController pushViewController:tableViewTestVC animated:YES];
}

//跳转JS&iOS交互页面
- (void)pushToJSInteractiveiOSVC {
    
    JSInteractiveiOSViewController * jsAndiOSVC = [[JSInteractiveiOSViewController alloc] init];
    [self.navigationController pushViewController:jsAndiOSVC animated:YES];
}

//跳转JSPatch热修改页面
- (void)pushToJSPatchTestVC {
    
    JSPatchTestViewController * jsPatchVC = [[JSPatchTestViewController alloc] init];
    [self.navigationController pushViewController:jsPatchVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

