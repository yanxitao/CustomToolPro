//
//  JSInteractiveiOSViewController.m
//  CustomTool
//
//  Created by 燕戏涛 on 2017/12/6.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#import "JSInteractiveiOSViewController.h"
#import "SZKoclaJScontextModel.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface JSInteractiveiOSViewController ()<UIWebViewDelegate, SZKoclaJScontextModelDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic)   UIWebView                       *webView;
@property (strong, nonatomic)   JSContext                       *jsContext;
@property (strong, nonatomic)   UIImagePickerController         *imagePickerController;

@end

@implementation JSInteractiveiOSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.webView];
    self.view.backgroundColor = [UIColor whiteColor];
    self.webView.backgroundColor = [UIColor whiteColor];
    self.webView.delegate = self;
    NSURL * htmlURL = [[NSBundle mainBundle] URLForResource:@"index.html" withExtension:nil];
    NSURLRequest * request = [NSURLRequest requestWithURL:htmlURL];
    self.webView.backgroundColor = [UIColor clearColor];
    [self.webView loadRequest:request];
    [self.view addSubview:self.webView];
    
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc] initWithTitle:@"调用js" style:UIBarButtonItemStylePlain target:self action:@selector(btnJS:)];
    [self.navigationItem setRightBarButtonItem:rightItem];
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    self.jsContext = [self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    /*****************说明**************
     用model的原因是防止内存泄漏
     
     很多demo是这样写的
     self.jsContext[@"web"] = self;
     但是这样写会造成循环引用，导致内存泄漏
     ****************/
    SZKoclaJScontextModel * model = [SZKoclaJScontextModel new];
    self.jsContext[@"web"] = model;
    model.jsContext = self.jsContext;
    [model setDelegate:self];
//    self
    self.jsContext.exceptionHandler = ^(JSContext *context, JSValue *exception) {
        context.exception = exception;
        NSLog(@"%@", exception);
    };
    
    self.jsContext[@"testobject"] = model;
    
    //同样我们也用刚才的方式模拟一下js调用方法
    NSString * jsStr1 = @"testobject.TestNOParameter()";
    [self.jsContext evaluateScript:jsStr1];
    NSString * jsStr2 = @"testobject.TestOneParameter('参数1')";
    [self.jsContext evaluateScript:jsStr2];
    
}

#pragma mark js调用iOS方法
- (void)share {
    
    NSArray * args = [JSContext currentArguments];
    [self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"shareCallback()"]];
    NSLog(@"%@", args);

}

#pragma mark iOS调用js方法
-(void)btnJS:(id)sender{

    //方式一
    [self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"callCamera()"]];//弹出js的alert;
    NSString * result = [self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"callBack(%@,%@)",@"123",@"456"]];
    
    //方法二
    JSValue * result1 = [self.jsContext evaluateScript:[NSString stringWithFormat:@"callBack(%@,%@)",@"123",@"789"]];//使用jsContext调用js方法回调成功弹出js的alert;
    
    //方法三
    JSValue * jsFunction = self.jsContext[@"callBack"];
    JSValue * result2 = [jsFunction callWithArguments:@[@"345",@"123"]];//如果有参数，数组里面跟对应参数例如：@[@"123",@"ewqe"]
    JSValue * result3 = [jsFunction callWithArguments:@[[NSNumber numberWithInt:123],[NSNumber numberWithInt:567]]];
    
    NSLog(@"%@",result);
    NSLog(@"%@",[result1 description]);
    NSLog(@"%@",[result2 description]);
    NSLog(@"%@",[result3 description]);
    
}

-(void)callCamera:(JSContext *)context{
    context[@"callCamera"] = ^() {
        
//        NSArray *args = [JSContext currentArguments];//如果有参数，使用这种方法获取参数；
        NSLog(@"callCamera");
        self.imagePickerController = [[UIImagePickerController alloc] init];
        self.imagePickerController.delegate = self;
        self.imagePickerController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        self.imagePickerController.allowsEditing = YES;
        self.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:self.imagePickerController animated:YES completion:^{
            
        }];
    };
}

- (void)callBackTest {
    
    NSArray * args = [JSContext currentArguments];
    
    //方法一
    [self.webView stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:@"shareCallback()"]];//使用webView回调成功弹出js的alert;
    NSLog(@"%@", args);
    
    //方法二
    [self.jsContext evaluateScript:@"shareCallback()"];//使用jsContext调用js方法回调成功弹出js的alert;
    
    //方法三
    JSValue * jsFunction = self.jsContext[@"shareCallback"];
    
    [jsFunction callWithArguments:@[]];//如果有参数，数组里面跟对应参数例如：@[@"123",@"ewqe"]
    
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
