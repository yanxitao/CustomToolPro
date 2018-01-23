//
//  AlgorithmTestViewController.m
//  CustomTool
//
//  Created by 燕戏涛 on 2017/11/28.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#import "AlgorithmTestViewController.h"

@interface AlgorithmTestViewController ()
@property (weak, nonatomic) IBOutlet UIButton *stringToIntBtn;

@end

@implementation AlgorithmTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSLog(@"%@", [self rangeOfSubString:@"ab" inString:@"bbabcdadfafablklkjlklab"]);
}

- (IBAction)stringToIntAction:(id)sender {
    
    NSString * tempStr1 = @"1234567";
    NSString *regex =@"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)";
    NSRange range = [tempStr1 rangeOfString:regex options:NSRegularExpressionSearch];
    NSString * subStr = [tempStr1 substringWithRange:range];
    
    NSString *newStr =@"1234567";
    NSString *temp =nil;
    for(int i =0; i < [newStr length]; i++)
    {
        temp = [newStr substringWithRange:NSMakeRange(i,1)];
        NSLog(@"第%d个字是:%@",i,temp);
    }
    
}

- (NSArray*)rangeOfSubString:(NSString*)subStr inString:(NSString*)string {
    NSMutableArray *rangeArray = [NSMutableArray array];
    NSString*string1 = [string stringByAppendingString:subStr];
    NSString *temp;
    for(int i =0; i < string.length; i ++) {
        temp = [string1 substringWithRange:NSMakeRange(i, subStr.length)];
        if ([temp isEqualToString:subStr]) {
            NSRange range = {i,subStr.length};
            [rangeArray addObject: [NSValue valueWithRange:range]];
        }
    }
    return rangeArray;
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
