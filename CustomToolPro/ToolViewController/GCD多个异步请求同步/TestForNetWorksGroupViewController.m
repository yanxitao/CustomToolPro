//
//  TestForNetWorksGroupViewController.m
//  CustomTool
//
//  Created by 燕戏涛 on 2017/11/22.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#import "TestForNetWorksGroupViewController.h"
#import "TestMultiRequestObject.h"
#import <objc/runtime.h>
#import "UIImage+withDownLoadURL.h"
#define commandKey @"command"

@interface TestForNetWorksGroupViewController ()

{
    UIImageView                         *runtimeImage;
}

@property (nonatomic, strong) NSString *downLoadURL;

@end

@implementation TestForNetWorksGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIButton * firstErrorMethodBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [firstErrorMethodBtn setFrame:CGRectMake(0, 50, 200, 50)];
    [firstErrorMethodBtn setCenterX:SCREEN_WID/2];
    [firstErrorMethodBtn setTitle:@"错误方法1" forState:UIControlStateNormal];
    [firstErrorMethodBtn setBackgroundColor:[UIColor grayColor]];
    firstErrorMethodBtn.layer.cornerRadius = 4;
    firstErrorMethodBtn.layer.masksToBounds = YES;
    [firstErrorMethodBtn addTarget:self action:@selector(firstErrorMethod) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:firstErrorMethodBtn];

    UIButton * secondErrorMethodBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [secondErrorMethodBtn setFrame:CGRectMake(0, 120, 200, 50)];
    [secondErrorMethodBtn setCenterX:SCREEN_WID/2];
    [secondErrorMethodBtn setTitle:@"错误方法2" forState:UIControlStateNormal];
    [secondErrorMethodBtn setBackgroundColor:[UIColor grayColor]];
    secondErrorMethodBtn.layer.cornerRadius = 4;
    secondErrorMethodBtn.layer.masksToBounds = YES;
    [secondErrorMethodBtn addTarget:self action:@selector(secodErrorMethod) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:secondErrorMethodBtn];

    UIButton * rightMethodBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightMethodBtn setFrame:CGRectMake(0, 190, 200, 50)];
    [rightMethodBtn setCenterX:SCREEN_WID/2];
    [rightMethodBtn setTitle:@"正确方法" forState:UIControlStateNormal];
    [rightMethodBtn setBackgroundColor:[UIColor grayColor]];
    rightMethodBtn.layer.cornerRadius = 4;
    rightMethodBtn.layer.masksToBounds = YES;
    [rightMethodBtn addTarget:self action:@selector(rightMethod) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rightMethodBtn];
    
    UIButton * runtimeTestBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [runtimeTestBtn setFrame:CGRectMake(0, 260, 200, 50)];
    [runtimeTestBtn setCenterX:SCREEN_WID/2];
    [runtimeTestBtn setTitle:@"图片下载withRuntime为分类添加属性" forState:UIControlStateNormal];
    [runtimeTestBtn setBackgroundColor:[UIColor grayColor]];
    runtimeTestBtn.layer.cornerRadius = 4;
    runtimeTestBtn.layer.masksToBounds = YES;
    [runtimeTestBtn addTarget:self action:@selector(setImageWithRuntime) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:runtimeTestBtn];
    
    runtimeImage = [[UIImageView alloc] init];
    [runtimeImage setFrame:CGRectMake(0, 330, 100, 100)];
    [runtimeImage setCenterX:SCREEN_WID/2];
    [runtimeImage setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:runtimeImage];

    UIButton * responderBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [responderBtn setFrame:CGRectMake(0, 400, 200, 50)];
    [responderBtn setCenterX:SCREEN_WID/2];
    [responderBtn setTitle:@"响应链测试" forState:UIControlStateNormal];
    [responderBtn setBackgroundColor:[UIColor grayColor]];
    responderBtn.layer.cornerRadius = 4;
    responderBtn.layer.masksToBounds = YES;
    [responderBtn addTarget:self action:@selector(responderAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:responderBtn];
    
}

- (void)firstErrorMethod {
    
    [[TestMultiRequestObject new] testUsingGroup1];
}

- (void)secodErrorMethod {
    
    [[TestMultiRequestObject new] testUsingGroup2];
}

- (void)rightMethod {
    
    [[TestMultiRequestObject new] testUsingSemaphore];
}

- (void)setImageWithRuntime {
    
    UIImage * bgImage = [[UIImage alloc] init];
    bgImage.downLoadURL = @"http://img.taopic.com/uploads/allimg/120727/201995-120HG1030762.jpg";
    [runtimeImage setImage:bgImage];
}

- (UIViewController *)responderAction:(UIButton *)curBtn {
    
    UIResponder *responder = [self nextResponder];
   
    while (responder)
        
    {
        
        if ([responder isKindOfClass:[UIViewController class]])
            
        {
            NSLog(@"%@", responder);
            return (UIViewController *)responder;
            
        }
        
        responder = [responder nextResponder];
        NSLog(@"%@", responder);

    }
    
    return nil;

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
