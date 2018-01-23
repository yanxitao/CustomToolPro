//
//  FirstCell.m
//  CustomTool
//
//  Created by 燕戏涛 on 2017/12/5.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#import "FirstCell.h"
#import "FirstTestViewController.h"

@implementation FirstCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)pushTestVCAction:(id)sender {
    
    FirstTestViewController * firstTestVC = [[FirstTestViewController alloc] init];
    [[self navigationController] pushViewController:firstTestVC animated:YES];

}

//获取当前控件的控制器（用于不写代理在子view中跳转）
- (UINavigationController *)navigationController {
    
    for (UIView * next = [self superview]; next; next = next.superview) {
        UIResponder * nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UINavigationController class]]) {
            return (UINavigationController *)nextResponder;
        }
    }
    return nil;
}

@end
