//
//  DMShareSheet.m
//  DMall
//
//  Created by wangzhenchao on 15/6/30.
//  Copyright (c) 2015年 wintech. All rights reserved.
//

#import "DMShareSheet.h"
#import "UIImage+Utility.h"

@interface DMShareSheet()


//@property(nonatomic, assign) DMShareType     shareType;
//@property(nonatomic, strong) NSString        *idString;

@end

@implementation DMShareSheet
{
    UIView      *_bgView;
    UIImage     *bgImage;
    CGSize      _itemSize;
    NSArray     *shareImageArr;
    NSArray     *shareTextArr;
    UIImageView *closeImageView;
    UIView      *bgContentView;
}

-(id)initWithShareType:(NSArray *)type{

    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    
    _buttons = [[NSMutableArray alloc] initWithCapacity:0];
    _bgButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_bgButton setFrame:self.bounds];
    [_bgButton setBackgroundColor:[UIColor colorWithWhite:0.5 alpha:0.4]];
    [_bgButton setAlpha:0.5f];
    [_bgButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_bgButton];
    
    bgContentView = [[UIView alloc] init];
    [bgContentView setFrame:self.frame];
    [bgContentView setBackgroundColor:[UIColor colorWithString:@"0x000000"]];
    [bgContentView setAlpha:0.6];
    [bgContentView setUserInteractionEnabled:NO];
    [_bgButton addSubview:bgContentView];
    
    shareImageArr = [[NSArray alloc] initWithObjects:@"shareWechat.png",@"shareWechatPengyou.png", nil];
    shareTextArr = [[NSArray alloc] initWithObjects:@"微信",@"朋友圈", nil];

    NSInteger minHMargin = 10;
    NSInteger minVmargin = 10;
    UIEdgeInsets inset = UIEdgeInsetsMake(minVmargin, minHMargin, minVmargin, minHMargin);
    
    float itemWidth = ([UIScreen mainScreen].bounds.size.width -inset.left -inset.right +minHMargin)/4;
    
    _itemSize = CGSizeMake(itemWidth, itemWidth);
    //        NSInteger numOfItems = shareImageArr.count;
    NSInteger column = shareTextArr.count;
    
    NSInteger num = MIN(column, shareImageArr.count);
    minHMargin = (self.width - num * _itemSize.width) / (num + 1);
    for (int i = 0; i < shareTextArr.count; i++)
    {
        NSInteger c = i % column;
        DMTabButton *tabButton = [DMTabButton buttonWithType:UIButtonTypeCustom];
        [tabButton setFrame:CGRectMake(minHMargin + (minHMargin + _itemSize.width) * c, SCREEN_HEI, _itemSize.width, _itemSize.height)];
        [tabButton addTarget:self action:@selector(onItemClicked:) forControlEvents:UIControlEventTouchUpInside];
        [tabButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [tabButton.titleLabel setFont:[UIFont systemFontOfSize:13]];
        [tabButton setTitle:shareTextArr[i] forState:UIControlStateNormal];
        [tabButton setImage:[UIImage imageNamed:shareImageArr[i]] forState:UIControlStateNormal];
        [tabButton setTag:1001 + i];
        [tabButton setSpacing:4];
        [_buttons addObject:tabButton];
        [_bgButton addSubview:tabButton];
        
    }
    return self;
}

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        
        _buttons = [[NSMutableArray alloc] initWithCapacity:0];
        _bgButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_bgButton setFrame:self.bounds];
        [_bgButton setBackgroundColor:[UIColor colorWithWhite:0.5 alpha:0.4]];
        [_bgButton setAlpha:0.5f];
        [_bgButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_bgButton];
        
        bgContentView = [[UIView alloc] init];
        [bgContentView setFrame:CGRectMake(0, self.height - 240, self.width, 240)];
        [bgContentView setBackgroundColor:[UIColor whiteColor]];
//        [bgContentView setAlpha:0.6];
        [bgContentView setUserInteractionEnabled:NO];
        [_bgButton addSubview:bgContentView];
        
        shareImageArr = [[NSArray alloc] initWithObjects:@"shareWechat.png",@"shareWechatPengyou.png", nil];
        shareTextArr = [[NSArray alloc] initWithObjects:@"微信好友",@"朋友圈", nil];
//        NSInteger topMargin = 10;
        NSInteger minHMargin = 10;
        NSInteger minVmargin = 10;
        UIEdgeInsets inset = UIEdgeInsetsMake(minVmargin, minHMargin, minVmargin, minHMargin);
        
        float itemWidth = ([UIScreen mainScreen].bounds.size.width -inset.left -inset.right +minHMargin)/4;
        
        _itemSize = CGSizeMake(itemWidth, itemWidth + 20);
//        NSInteger numOfItems = shareImageArr.count;
        NSInteger column = shareTextArr.count;
        
        NSInteger num = MIN(column, shareImageArr.count);
        minHMargin = (self.width - num * _itemSize.width) / (num + 1);
        for (int i = 0; i < shareTextArr.count; i++)
        {
//            NSInteger r = i / column;
            NSInteger c = i % column;
            DMTabButton *tabButton = [DMTabButton buttonWithType:UIButtonTypeCustom];
            [tabButton setFrame:CGRectMake(minHMargin + (minHMargin + _itemSize.width) * c, SCREEN_HEI, _itemSize.width, _itemSize.height)];
            [tabButton addTarget:self action:@selector(onItemClicked:) forControlEvents:UIControlEventTouchUpInside];
            [tabButton setTitleColor:[UIColor colorWithString:@"#333333"] forState:UIControlStateNormal];
            [tabButton.titleLabel setFont:[UIFont systemFontOfSize:13]];
            [tabButton setTitle:shareTextArr[i] forState:UIControlStateNormal];
            [tabButton setImage:[UIImage imageNamed:shareImageArr[i]] forState:UIControlStateNormal];
            [tabButton setTag:1001 + i];
            [tabButton setSpacing:3];
            [_buttons addObject:tabButton];
            [_bgButton addSubview:tabButton];
        }
        
        UIView * lineView = [[UIView alloc] init];
        [lineView setFrame:CGRectMake(0, bgContentView.height - 61, SCREEN_WID, 0.5)];
        [lineView setBackgroundColor:[UIColor colorWithString:@"0xc0c0c0"]];
        [bgContentView addSubview:lineView];
        
        UILabel * closeLabel = [[UILabel alloc] init];
        [closeLabel setFrame:CGRectMake(0, bgContentView.height - 60, SCREEN_WID, 50)];
        [closeLabel setText:@"取消"];
        [closeLabel setTextColor:[UIColor colorWithString:@"0x333333"]];
        [closeLabel setFont:[UIFont systemFontOfSize:17]];
        [closeLabel setTextAlignment:NSTextAlignmentCenter];
        [bgContentView addSubview:closeLabel];
        
//        closeImageView = [[UIImageView alloc] init];
//        [closeImageView setFrame:CGRectMake(0, 0, 33, 33)];
//        closeImageView.centerY = SCREEN_HEI + 30;
//        closeImageView.centerX = self.centerX;
//        [closeImageView setContentMode:UIViewContentModeScaleAspectFit];
//        [closeImageView setImage:[UIImage imageNamed:@"closeShare_Btn"]];
//        [_bgButton addSubview:closeImageView];
    }
    return self;
}

#pragma mark - 
- (void)onItemClicked:(UIButton *)sender
{
    NSInteger index = [_buttons indexOfObject:sender];
    if(index >= 0 && index < _buttons.count)
    {
        if([self.DMShareSheetDelegate respondsToSelector:@selector(didTapBtn:btnType:)])
            [self.DMShareSheetDelegate didTapBtn:self btnType:index];
    }
    [self dismiss];
}

#pragma mark - 开始动画
- (void)appearSpringAnimate{

    for (int i = 0; i < 2; i++) {
        if (i == 0) {
            
            [UIView animateWithDuration:0.5
                                  delay:0
                 usingSpringWithDamping:0.5
                  initialSpringVelocity:0
                                options:UIViewAnimationOptionCurveEaseOut
                             animations:^{
                                 bgContentView.centerY = SCREEN_HEI - 120;
                                 closeImageView.centerY = SCREEN_HEI - 90;
                             }
                             completion:nil];
            
            [UIView animateWithDuration:0.5
                                  delay:0
                 usingSpringWithDamping:0.5
                  initialSpringVelocity:0
                                options:UIViewAnimationOptionCurveEaseOut
                             animations:^{
                                 [self viewWithTag:1002].centerY = SCREEN_HEI - 150;
                                 [self viewWithTag:1003].centerY = SCREEN_HEI - 150;
                             }
                             completion:nil];
        }else if (i == 1){
            [UIView animateWithDuration:0.4
                                  delay:0.1
                 usingSpringWithDamping:0.5
                  initialSpringVelocity:0
                                options:UIViewAnimationOptionCurveEaseOut
                             animations:^{
                                 [self viewWithTag:1001].centerY = SCREEN_HEI - 150;
//                                 [self viewWithTag:1004].centerY = self.centerY;
                             }
                             completion:nil];
        }
    }
}

#pragma mark - 结束动画
- (void)disappearSpringAnimate{
    
    for (int i = 0; i < 2; i++) {
        
        if (i == 0) {
            
            [UIView animateWithDuration:0.2
                                  delay:0
                                options:UIViewAnimationOptionCurveEaseOut
                             animations:^{
                                 [self viewWithTag:1002].centerY = [self viewWithTag:1002].centerY - 50;
                                 [self viewWithTag:1003].centerY = [self viewWithTag:1003].centerY - 50;
                             }
                             completion:^(BOOL finrsh){
//                                 if (i == 0) {
                                     [UIView animateWithDuration:0.4
                                                           delay:0
                                                         options:UIViewAnimationOptionCurveEaseOut
                                                      animations:^{
                                                          [self viewWithTag:1002].centerY = SCREEN_HEI+_itemSize.height;
                                                          [self viewWithTag:1003].centerY = SCREEN_HEI+_itemSize.height;
                                                      }
                                                      completion:nil];
                             }];


        }else if (i == 1) {
            [UIView animateWithDuration:0.2
                                  delay:0.1
                                options:UIViewAnimationOptionCurveEaseOut
                             animations:^{
                                 [self viewWithTag:1001].centerY = [self viewWithTag:1001].centerY - 50;
//                                 [self viewWithTag:1004].centerY = self.centerY - 50;
                             }
                             completion:^(BOOL finrsh){
                                 //                                 if (i == 0) {
                                 [UIView animateWithDuration:0.4
                                                       delay:0
                                                     options:UIViewAnimationOptionCurveEaseOut
                                                  animations:^{
                                                      [self viewWithTag:1001].centerY = SCREEN_HEI+_itemSize.height;
//                                                      [self viewWithTag:1004].centerY = SCREEN_HEI+_itemSize.height;
                                                      closeImageView.centerY = SCREEN_HEI + 30;

                                                  }
                                                  completion:^(BOOL finrsh){
                                                      [UIView animateWithDuration:0.3 animations:^{
                                                          _bgButton.alpha = 0.f;
                                                      } completion:^(BOOL finished) {
                                                          
                                                          [UIView animateWithDuration:0.5
                                                                                delay:0
                                                               usingSpringWithDamping:0.5
                                                                initialSpringVelocity:0
                                                                              options:UIViewAnimationOptionCurveEaseOut
                                                                           animations:^{
                                                                               bgContentView.centerY = SCREEN_HEI + 120;
                                                                           }
                                                                           completion:nil];
                                                          
                                                          [self removeFromSuperview];
                                                      }];
                                                  }];
                             }];
        }
    }

}

- (void)show:(UIView *)bgView//传参当前VIEW，self.view
{

//    UIView * bgImageView = [DMAppDelegate appDelegate].window;
//    
//    CGRect rect = bgImageView.frame;
//    UIGraphicsBeginImageContext(rect.size);
//    CGContextRef contextRef = UIGraphicsGetCurrentContext();
//    [bgImageView.layer renderInContext:contextRef];
//    UIImage * img =UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
    
    //模糊背景图片处理
//    bgImage             = [[UIImage alloc] init];
//    bgImage             = [img setImageToBlurWithBlurRadius:4];
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:self];
    _bgButton.alpha = 0.f;
//    [_bgButton setImage:bgImage forState:UIControlStateNormal];
//    [_bgButton setImage:bgImage forState:UIControlStateHighlighted];
    
    _contentView.transform = CGAffineTransformMakeScale(1.1, 1.1);
    [UIView animateWithDuration:0.1 animations:^{
//        [bgContentView setAlpha:0.6];
        _bgButton.alpha = 1.f;
        _contentView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [self appearSpringAnimate];
    }];
}

- (void)dismiss
{

    [self disappearSpringAnimate];

}


@end
