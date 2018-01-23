//
//  ApplyThreeTableViewCell.m
//  yz-app
//
//  Created by 燕戏涛 on 16/3/30.
//  Copyright © 2016年 燕戏涛. All rights reserved.
//

#import "ApplyThreeTableViewCell.h"

@implementation ApplyThreeTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];

    self.reasonView.layer.masksToBounds = YES;
    self.reasonView.layer.borderWidth = 0.5;
    self.reasonView.layer.borderColor = [UIColor grayColor].CGColor;
    self.reasonView.layer.cornerRadius = 4;
    
    self.reasonTextView.delegate = self;
    
    self.backgroundColor = [UIColor colorWithString:@"#f3f6f9"];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)textViewDidBeginEditing:(UITextView *)textView{

    if ([textView.text isEqualToString:@"请假三天以上必须填写"]) {
        textView.text = @"";
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView{

    if (textView.text.length < 1) {
        textView.text = @"请假三天以上必须填写";
    }
}



@end
