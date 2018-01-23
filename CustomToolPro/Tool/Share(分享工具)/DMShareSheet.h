//
//  DMShareSheet.h
//  DMall
//
//  Created by wangzhenchao on 15/6/30.
//  Copyright (c) 2015年 wintech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DMTabButton.h"
typedef NS_ENUM(NSInteger, DMShareSheetType) {
    DMShareSheetTypeWXSceneSession = 0,
    DMShareSheetTypeWXSceneTimeline,
    DMShareSheetTypeSinaWebo
};

//
/////商详、订单详情、app、活动
//typedef NS_ENUM(NSInteger, DMShareType) {
//    DMShareTypeWarDetail = 0,
//    DMShareTypeOrderDetail,
//    DMShareTypeApp,
//    DMShareTypeAcitvie
//};

@class DMShareSheet;
@protocol DMShareSheetDelegate <NSObject>

- (void) didTapBtn:(DMShareSheet *) view btnType:(DMShareSheetType) btnType;

@end

@interface DMShareSheet : UIView
{
    NSMutableArray*     _buttons;
    UIButton*           _bgButton;
    UIView*             _contentView;
}
//@property (nonatomic, assign) CGSize    itemSize;

@property (nonatomic, weak) id<DMShareSheetDelegate>   DMShareSheetDelegate;

- (void)show:(UIView *)bgImageView;//传参当前VIEW，self.view


- (id) initWithShareType:(NSArray *)type;
@end
