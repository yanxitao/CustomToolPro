//
//  JKViewController.m
//  jk2cloud
//
//  Created by 燕戏涛 on 2017/9/1.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#import "JKViewController.h"

@interface JKViewController ()

@end

@implementation JKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage * image = [UIImage imageNamed:@"backImage"];
//    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    
//    UIBarButtonItem * backItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
//    UIImageView * backImageView = [[UIImageView alloc] init];
//    [backImageView setFrame:CGRectMake(0, 0, 23, 23)];
//    [backImageView setImage:image];
    
    UIButton * backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setFrame:CGRectMake(0, 0, 10, 18)];
    [backBtn setImage:image forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backBtn) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    
//    UIBarButtonItem * backItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(backBtn)];
//    [backItem setBackgroundImage:image forState:UIControlStateNormal barMetrics:UIBarMetricsCompact];
//    self.navigationItem.leftBarButtonItem = backItem;
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UINavigationController *nav = self.navigationController;
    //设置导航栏颜色
    [nav.navigationBar setBarTintColor:[UIColor colorWithString:@"#f3f6f9"]];
    //导航栏没有半透明效果
    nav.navigationBar.translucent = NO;
    //设置导航栏标题颜色
    [nav.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Semibold" size:16],NSForegroundColorAttributeName:[UIColor colorWithString:@"#45474a"]}];
    [nav.navigationBar setTintColor:[UIColor blackColor]];
    
    //隐藏导航栏下面的线条
    [nav.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    nav.navigationBar.shadowImage = [UIImage new];

}

- (void)backBtn {

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
