//
//  DMAlertView.h
//  DMall
//
//  Created by chris on 15/5/12.
//  Copyright (c) 2015年 wintech. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DMCompleteBlock)(NSInteger selectIndex);
typedef void(^DMFinishBlock)(BOOL finish);

@interface DMAlertView : UIView
{
    NSMutableArray* _buttonArray;
    UIView*     _bgView;
    UIView*     _contentView;
    UILabel*    _titleLabel;
    UILabel*    _messageLabel;
}

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message buttons:(NSArray *)buttons callBack:(DMCompleteBlock)callBack;
- (void) show;
//订单提交弹窗
- (instancetype)initWithPayType:(NSString *)payType deliveryType:(NSString *)delivery deliveryTime:(NSString *)deliveryTmie callBack:(DMFinishBlock)callBack;

@end

