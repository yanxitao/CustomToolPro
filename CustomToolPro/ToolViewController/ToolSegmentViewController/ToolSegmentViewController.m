//
//  ToolSegmentViewController.m
//  CustomTool
//
//  Created by 燕戏涛 on 2017/10/31.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#import "ToolSegmentViewController.h"
#import "SegmentView.h"

@interface ToolSegmentViewController ()

{
    
    NSArray                             *segmentValueArr;
    UIImageView                         *leftSelectedImage;
    
}

//@property (nonatomic, strong)           UISegmentedControl                      *segment;

@end

@implementation ToolSegmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initSegment];
}

//自己封装
//- (void)initSegmentView {
//
//    self.segmentValueArr = @[@"统计", @"店员"];
//
//    self.segment = [[UISegmentedControl alloc] initWithItems:self.segmentValueArr];
//    self.segment.frame = CGRectMake(15, 0, SCREEN_WID - 30, 60);
//
//    //    self.segment.layer.borderWidth = 5;
//    //    self.segment.layer.borderColor = [UIColor whiteColor].CGColor;
//    //    [self.segment setDividerImage:[UIImage imageNamed:@"selectedLineImage"] forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
//    //    [self.segment setBackgroundImage:[UIImage new] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
//    //    [self.segment setBackgroundImage:[UIImage imageNamed:@"selectedLineImage"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
//    //    [self.segment setBackgroundImage:[UIImage imageNamed:@"navBGColor_img"] forState:UIControlStateNormal | UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
//    //    [self.segment setBackgroundImage:[UIImage imageNamed:@"navBGColor_img"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
//    self.segment.tintColor = [UIColor clearColor];
//    [self.segment setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor colorWithString:@"#9da9b3"], NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Semibold" size:15]} forState:UIControlStateNormal];
//    [self.segment setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor colorWithString:@"#56a7ff"], NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Semibold" size:15]} forState:UIControlStateSelected];
//    [self.segment addTarget:self action:@selector(segmentChange:) forControlEvents:UIControlEventValueChanged];
//    [self.view addSubview:self.segment];
//
//    leftSelectedImage = [[UIImageView alloc] init];
//    [leftSelectedImage setFrame:CGRectMake(0, 0, 32, 1)];
//    [leftSelectedImage setBackgroundColor:[UIColor colorWithString:@"#56a7ff"]];
//    [leftSelectedImage setCenter:CGPointMake((SCREEN_WID - 30)/2/2, 45)];
//    [self.segment addSubview:leftSelectedImage];
//
//    self.segment.selectedSegmentIndex = 0;
//
//}

//三方封装
- (void)initSegment{
    
    segmentValueArr = @[@"个人",@"团队"];
    
    //    SegmentView *segmentView = [[SegmentView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WID, SCREEN_HEI) titleArray:self.segmentValueArr selectType:0];
    SegmentView * segmentView = [[SegmentView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WID, SCREEN_HEI) titleArray:segmentValueArr selectType:0 viewType:1];
    segmentView.typeView = 1;
    segmentView.lineColor = [UIColor whiteColor];
    [self.view addSubview:segmentView];
    
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
