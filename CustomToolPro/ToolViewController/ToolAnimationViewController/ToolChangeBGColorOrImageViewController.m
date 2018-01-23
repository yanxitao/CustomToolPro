//
//  ToolChangeBGColorOrImageViewController.m
//  CustomTool
//
//  Created by 燕戏涛 on 2017/11/2.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#import "ToolChangeBGColorOrImageViewController.h"
#import "UIView+YXTTransform.h"

@interface ToolChangeBGColorOrImageViewController ()

{
    NSArray                         *bgColorArr;
    NSArray                         *bgImageArr;
    UIButton                        *changeColorBtn;
    UIButton                        *changeImageBtn;
}

@end

@implementation ToolChangeBGColorOrImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    bgColorArr = [[NSArray alloc] init];
    bgColorArr = @[[UIColor yellowColor], [UIColor redColor], [UIColor blueColor]];
    
    bgImageArr = [[NSArray alloc] init];
    bgImageArr = @[@"3cbd08380cd791234af886c2a9345982b2b7802e", @"61e0cc44ad3459825392f72408f431adcbef842e", @"85cdef025aafa40f2969d26baf64034f79f01992"];
    
    changeColorBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [changeColorBtn setFrame:CGRectMake(0, 0, 100, 50)];
    [changeColorBtn setCenter:CGPointMake(SCREEN_WID/2, 100)];
    [changeColorBtn setTitle:@"改变背景颜色" forState:UIControlStateNormal];
    [changeColorBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [changeColorBtn setBackgroundColor:[UIColor grayColor]];
    changeColorBtn.layer.cornerRadius = 4;
    changeColorBtn.layer.masksToBounds = YES;
    [changeColorBtn addTarget:self action:@selector(changeBGColor) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:changeColorBtn];
    
    changeImageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [changeImageBtn setFrame:CGRectMake(0, 0, 100, 50)];
    [changeImageBtn setCenter:CGPointMake(SCREEN_WID/2, 200)];
    [changeImageBtn setTitle:@"改变背景图片" forState:UIControlStateNormal];
    [changeImageBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [changeImageBtn setBackgroundColor:[UIColor grayColor]];
    changeImageBtn.layer.cornerRadius = 4;
    changeImageBtn.layer.masksToBounds = YES;
    [changeImageBtn addTarget:self action:@selector(changeBGImage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:changeImageBtn];

}

- (void)changeBGColor {
    
    [self.view YXTTransform_circleColor_toColor:bgColorArr[arc4random() % 3] Duration:0.5 StartPoint:CGPointMake(300, 350)];
    //    [changeColorBtn reloadInputViews];
}

- (void)changeBGImage {
    
    [self.view YXTTransform_circleImage_toImage:[UIImage imageNamed:bgImageArr[arc4random() % 3]] Duration:0.5 StartPoint:CGPointMake(50, 390)];
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
