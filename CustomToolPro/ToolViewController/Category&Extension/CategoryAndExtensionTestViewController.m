//
//  CategoryAndExtensionTestViewController.m
//  CustomTool
//
//  Created by 燕戏涛 on 2017/12/4.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#import "CategoryAndExtensionTestViewController.h"
#import "NSArray+ExtensionsTest.h"

@interface CategoryAndExtensionTestViewController ()

@end

@implementation CategoryAndExtensionTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)saveValueAction:(id)sender {
    [NSArray writetargetStr:@"11" ToFilePath:@"objectForKey"];
}

- (IBAction)takeValueAction:(id)sender {
    
#pragma mark ------------------containsObject函数for数组中是否含有该元素
    if ([[NSArray readFile:@"objectForKey"] containsObject:@"11"]) {
        NSLog(@"已经有了");
    }
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
