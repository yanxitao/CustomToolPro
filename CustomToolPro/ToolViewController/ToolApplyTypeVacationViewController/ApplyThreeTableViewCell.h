//
//  ApplyThreeTableViewCell.h
//  yz-app
//
//  Created by 燕戏涛 on 16/3/30.
//  Copyright © 2016年 燕戏涛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ApplyThreeTableViewCell : UITableViewCell <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *reasonView;
@property (weak, nonatomic) IBOutlet UITextView *reasonTextView;

@end
