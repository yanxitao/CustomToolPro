//
//  ToolShareViewController.m
//  CustomTool
//
//  Created by 燕戏涛 on 2017/11/1.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#import "ToolShareViewController.h"
#import "DMGo2ShareCommon.h"

@interface ToolShareViewController ()

{
    DMGo2ShareCommon            *actionSheet;
}

@end

@implementation ToolShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIBarButtonItem * shareBtn = [[UIBarButtonItem alloc] initWithTitle:@"分享" style:UIBarButtonItemStyleDone target:self action:@selector(shareBtnAction)];
    shareBtn.tintColor = [UIColor colorWithString:@"0x4fd5d5"];
    self.navigationItem.rightBarButtonItem = shareBtn;
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Helvetica-Light" size:17],NSFontAttributeName, nil] forState:UIControlStateNormal];

}

- (void)shareBtnAction {

    actionSheet = [[DMGo2ShareCommon alloc] initWithShareType:DMShareTypeApp idString:nil shareWay:nil];
    actionSheet.shareTitle = @"测试";
    actionSheet.shareImgUrl = @"";
    actionSheet.shareUrl = @"www.baidu.com";
    actionSheet.shareInfo = @"消息测试";
    [actionSheet showShareSheet:self.view];

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
