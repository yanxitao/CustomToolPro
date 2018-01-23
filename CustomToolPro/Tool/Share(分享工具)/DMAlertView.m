//
//  DMAlertView.m
//  DMall
//
//  Created by chris on 15/5/12.
//  Copyright (c) 2015年 wintech. All rights reserved.
//

#import "DMAlertView.h"
//#import "UIColor+DMall.h"

#define kAlertViewWidth                 260
#define kConfirmViewWidth               300
#define kConfirmViewHeight              273
#define kMinMessageHeight               80
#define kTitleHMargin                   30
#define kTextVMargin                    25
#define kTextInnerMargin                20
#define kMessageHMargin                 40

#define kButtonHeight                   50

@interface DMAlertView ()

{
    UIView      *_cellView;
    UILabel     *_cellLabel;
    UIImageView *_headImg;
    UIButton    *_submitBtn;
    UIImageView *_rightImg;
    UIImageView *_loadingImg;
    UIView      *_lineView;
    float       angle;
    CGSize      titleSize;
    CGSize      messageSize;
}
@property(nonatomic, copy)      DMCompleteBlock     completeBlock;
@property(nonatomic, copy)      DMFinishBlock       finishBlock;

@end

@implementation DMAlertView

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message buttons:(NSArray *)buttons callBack:(DMCompleteBlock)callBack
{
    if(title.length == 0 && message.length == 0)
        return nil;
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if(self)
    {
        self.completeBlock = callBack;
        _bgView = [[UIView alloc] initWithFrame:self.bounds];
        [_bgView setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.4]];
        [self addSubview:_bgView];
        
        if (title && title.length > 0) {
            titleSize = [title boundingRectWithSize:CGSizeMake(kAlertViewWidth - kTitleHMargin * 2, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont boldSystemFontOfSize:15]} context:nil].size;
        }
        if (message && message.length > 0) {
            messageSize = [message boundingRectWithSize:CGSizeMake(kAlertViewWidth - kMessageHMargin * 2, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil].size;
        }
        NSInteger height = 0;
        if(title.length > 0 && message.length > 0)
            height = titleSize.height + messageSize.height + kTextVMargin * 2 + kTextInnerMargin;
        else
            height = titleSize.height + messageSize.height + kTextVMargin * 2;
        
        _contentView = [[UIView alloc] initWithFrame:CGRectMake((self.width - kAlertViewWidth) / 2, (self.height - height) / 2 - 40, kAlertViewWidth, height + kButtonHeight)];
        [_contentView setBackgroundColor:[UIColor whiteColor]];
        [_contentView.layer setCornerRadius:5];
        [_contentView.layer setMasksToBounds:YES];
        [_bgView addSubview:_contentView];
        
        NSInteger spaceYStart = kTextVMargin;
        
        if(buttons.count > 0)
        {
            _buttonArray = [NSMutableArray array];
            
            if(buttons.count <= 2)
            {
                
                NSInteger buttonWidth = (_contentView.width - 0.5) / buttons.count;
                UIView *topLine = [[UIView alloc] initWithFrame:CGRectMake(0, _contentView.height - kButtonHeight - 0.5, _contentView.width, 0.5)];
                [topLine setBackgroundColor:[UIColor grayColor]];
                [_contentView addSubview:topLine];
                
                if (buttons.count == 2) {
                    
                    UIView *verLine = [[UIView alloc] initWithFrame:CGRectMake(buttonWidth, topLine.bottom, 0.5, kButtonHeight)];
                    [verLine setBackgroundColor:[UIColor grayColor]];
                    [_contentView addSubview:verLine];
                    
                }
                
                for (NSInteger i = 0; i < buttons.count; i++) {
                    
                    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
                    [button.titleLabel setFont:[UIFont systemFontOfSize:15]];
//                    [button setTitleColor:buttons.count<2? [UIColor grayColor] : (i==1? [UIColor grayColor] : [UIColor whiteColor]) forState:UIControlStateNormal];
                    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
                    [button setBackgroundColor:[UIColor whiteColor]];
                    [button setFrame:CGRectMake(buttonWidth * i + (0.5 *i), topLine.bottom, buttonWidth, kButtonHeight)];
                    [button addTarget:self action:@selector(onButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
                    [button setTitle:buttons[i] forState:UIControlStateNormal];
                    [_contentView addSubview:button];
                    [_buttonArray addObject:button];
                    
                }
            }else if (buttons.count >= 3){
                
                [_contentView setFrame:CGRectMake((self.width - kAlertViewWidth) / 2, (self.height - height) / 2 - 40, kAlertViewWidth, height + kButtonHeight * buttons.count)];
                [_contentView setCenter:CGPointMake(SCREEN_WID/2, SCREEN_HEI/2)];
                
                for (NSInteger i = 0; i < buttons.count; i++) {
                    
                    UIView *topLine = [[UIView alloc] initWithFrame:CGRectMake(0, height + kButtonHeight * i, _contentView.width, 0.5)];
                    [topLine setBackgroundColor:[UIColor whiteColor]];
                    [_contentView addSubview:topLine];
                    
                    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
                    [button.titleLabel setFont:[UIFont systemFontOfSize:15]];
                    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                    [button setFrame:CGRectMake(0, height + kButtonHeight * i + (0.5 * (i + 1)), _contentView.width, kButtonHeight)];
                    [button addTarget:self action:@selector(onButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
                    [button setTitle:buttons[i] forState:UIControlStateNormal];
                    [_contentView addSubview:button];
                    
                    [_buttonArray addObject:button];
                    
                }
            }
        }
        
        if(titleSize.height > 0)
        {
            _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake((_contentView.width - titleSize.width) / 2, spaceYStart, titleSize.width, titleSize.height)];
            [_titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
            [_titleLabel setNumberOfLines:0];
            [_titleLabel setLineBreakMode:NSLineBreakByWordWrapping];
            [_titleLabel setTextAlignment:NSTextAlignmentCenter];
            [_titleLabel setTextColor:[UIColor blackColor]];
            [_titleLabel setText:title];
            [_contentView addSubview:_titleLabel];
            spaceYStart += titleSize.height + kTextVMargin;
        }
        
        if(messageSize.height > 0)
        {
            _messageLabel = [[UILabel alloc] initWithFrame:CGRectMake((_contentView.width - messageSize.width) / 2, spaceYStart, messageSize.width, messageSize.height)];
            [_messageLabel setFont:[UIFont systemFontOfSize:14]];
            [_messageLabel setNumberOfLines:0];
            [_messageLabel setLineBreakMode:NSLineBreakByWordWrapping];
            [_messageLabel setTextAlignment:NSTextAlignmentCenter];
            [_messageLabel setTextColor:titleSize.height>0? [UIColor blackColor] : [UIColor blackColor]];
            [_messageLabel setText:message];
            [_contentView addSubview:_messageLabel];
        }
    }
    return self;
}

//订单提交弹窗(付款方式、配送方式、配送时间)
-(instancetype)initWithPayType:(NSString *)payType deliveryType:(NSString *)deliveryType deliveryTime:(NSString *)deliveryTime callBack:(DMFinishBlock)callBack{
    self.finishBlock = callBack;
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if(self)
    {
        _bgView = [[UIView alloc] initWithFrame:self.bounds];
        [_bgView setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.4]];
        [self addSubview:_bgView];
        
        NSString *delivery = [NSString stringWithFormat:@"%@%@", deliveryType, @"时间"];
        
        NSArray *labelValueArr = [[NSArray alloc] initWithObjects:payType,deliveryType, delivery,deliveryTime, nil];
        NSArray *imageArr = [[NSArray alloc] initWithObjects:@"confirmMessage_Type",@"confirmMessage_Car",@"confirmMessage_Time", nil];
        
        _contentView = [[UIView alloc] initWithFrame:CGRectMake((self.width - kConfirmViewWidth) / 2, (self.height - kConfirmViewHeight) / 2, kConfirmViewWidth, kConfirmViewHeight)];
        [_contentView setBackgroundColor:[UIColor grayColor]];
        [_contentView.layer setCornerRadius:5];
        [_contentView.layer setMasksToBounds:YES];
        [_bgView addSubview:_contentView];
        
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 49, _contentView.width, 1)];
        [_lineView setBackgroundColor:[UIColor grayColor]];
        [_contentView addSubview:_lineView];
        
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(0, _contentView.height - 50, _contentView.width, 1)];
        [_lineView setBackgroundColor:[UIColor grayColor]];
        [_contentView addSubview:_lineView];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _contentView.width, 49)];
        [_titleLabel setBackgroundColor:[UIColor grayColor]];
        [_titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
        [_titleLabel setNumberOfLines:0];
        [_titleLabel setLineBreakMode:NSLineBreakByWordWrapping];
        [_titleLabel setTextAlignment:NSTextAlignmentCenter];
        [_titleLabel setTextColor:[UIColor grayColor]];
        [_titleLabel setText:@"请确认订单信息"];
        [_contentView addSubview:_titleLabel];
        
        for (int i = 1; i <= 4; i++) {
            if (i < 4) {
                _cellView = [[UIView alloc] initWithFrame:CGRectMake(0, 35 + 40 * i, _contentView.width, 20)];
                _cellView.tag = 1000 + i;
                [_cellView setBackgroundColor:[UIColor clearColor]];
                [_contentView addSubview:_cellView];
                
                _cellLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 0, _contentView.width - 100, 20)];
                [_cellLabel setText:[labelValueArr objectAtIndex:i - 1]];
                [_cellLabel setFont:[UIFont systemFontOfSize:14]];
                [_cellView addSubview:_cellLabel];
            }else if (i == 4){
                _cellView = [[UIView alloc] initWithFrame:CGRectMake(0, 35 + 40 * (i - 1) + 20, _contentView.width, 20)];
                _cellView.tag = 1000 + i;
                [_cellView setBackgroundColor:[UIColor clearColor]];
                [_contentView addSubview:_cellView];
                
                _cellLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 0, _contentView.width - 100, 20)];
                [_cellLabel setText:[labelValueArr objectAtIndex:i - 1]];
                [_cellLabel setFont:[UIFont systemFontOfSize:13]];
                [_cellView addSubview:_cellLabel];
            }
        }
        
        for (int i = 1; i <= 3; i ++) {

            _rightImg = [[UIImageView alloc] initWithFrame:CGRectMake([self viewWithTag:1000 + i].width - 40, 0, 20, 20)];
            [_rightImg setImage:[UIImage imageNamed:@"confirmMessage_OK"]];
            [_rightImg setContentMode:UIViewContentModeCenter];
            [[self viewWithTag:1000 + i] addSubview:_rightImg];
            
            _headImg = [[UIImageView alloc] initWithFrame:CGRectMake(20, 0, 20, 20)];
            [_headImg setContentMode:UIViewContentModeCenter];
            [_headImg setImage:[UIImage imageNamed:[imageArr objectAtIndex:i - 1]]];
            [[self viewWithTag:1000 + i] addSubview:_headImg];
            
            if (i < 3) {
                _cellView = [[UIView alloc] initWithFrame:CGRectMake(0, 35 + 40 * i, _contentView.width, 20)];
                _cellView.tag = 2000 + i;
                [_cellView setBackgroundColor:[UIColor whiteColor]];
                [_contentView addSubview:_cellView];
            }else if (i == 3) {
                _cellView = [[UIView alloc] initWithFrame:CGRectMake(0, 35 + 40 * i, _contentView.width, 45)];
                _cellView.tag = 2000 + i;
                [_cellView setBackgroundColor:[UIColor whiteColor]];
                [_contentView addSubview:_cellView];
            }
        }
        
        _submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_submitBtn setFrame:CGRectMake(0, _contentView.height - 49, _contentView.width, 49)];
        [_submitBtn setTitle:@"正在创建订单" forState:UIControlStateNormal];
        [_submitBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [_submitBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_contentView addSubview:_submitBtn];
        
        _loadingImg = [[UIImageView alloc] initWithFrame:CGRectMake(_submitBtn.width/2 - 60, 0, 20, 49)];
        [_loadingImg setImage:[UIImage imageNamed:@"confirmMessage_Loading"]];
        [_loadingImg setContentMode:UIViewContentModeCenter];
        [_submitBtn addSubview:_loadingImg];
        
        [self rotationAnimate];
        [self viewAnimate];
    }
    return self;
}

//弹窗控件动效
- (void)viewAnimate{
    
    for (int i = 1; i <= 3; i++) {
        [UIView animateWithDuration:1.5 delay:(i - 1) + (0.5 * (i - 1)) options:UIViewAnimationOptionCurveEaseOut animations:^{
            if (i < 3) {
                [self viewWithTag:2000 + i].frame = CGRectMake(_contentView.width, 35 + 40 * i, 0, 20);
            }
            if (i == 3) {
                [self viewWithTag:2000 + i].frame = CGRectMake(_contentView.width, 35 + 40 * i, 0, 45);
            }
        } completion:^(BOOL finished){

            if (i == 3) {
                [UIView animateWithDuration:0 delay:1 options:UIViewAnimationOptionCurveEaseOut animations:^{} completion:^(BOOL finished){
                    [self finishDissmiss];
                }];
            }
        }];
    }
}

//loadingImg旋转动效
- (void)rotationAnimate{

    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        _loadingImg.transform = CGAffineTransformMakeRotation(M_PI);
    } completion:^(BOOL finished) {
        _loadingImg.transform = CGAffineTransformMakeRotation(0);
        [self rotationAnimate];
    }];
}

- (void)finishDissmiss{

    [self dismiss];
    self.finishBlock(YES);
}

- (void)onButtonClicked:(UIButton *)button
{
    [self dismiss];

    NSInteger index = [_buttonArray indexOfObject:button];
    if(index >= 0 && index < _buttonArray.count)
    {
        if(self.completeBlock)
            self.completeBlock(index);
    }
    
}

- (void)show
{
    UIView *topView = nil;
//    UIViewController *nextPage = [[DMAppDelegate appDelegate].curNavigator topPage:1];
//    if(nextPage)
//    {
//        UIViewController *topPage = [[DMAppDelegate appDelegate].curNavigator topPage];
//        topView = topPage.view;
//    }
//    else
        topView = [UIApplication sharedApplication].keyWindow;
    [topView addSubview:self];
    _bgView.alpha = 0.f;
    _contentView.transform = CGAffineTransformMakeScale(1.1, 1.1);
    [UIView animateWithDuration:0.3 animations:^{
        _bgView.alpha = 1.f;
        _contentView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)dismiss
{
    [UIView animateWithDuration:0.2 animations:^{
        _bgView.alpha = 0.f;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end

