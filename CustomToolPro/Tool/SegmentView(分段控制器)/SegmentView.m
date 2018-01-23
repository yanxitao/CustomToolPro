//
//  SegmentView.m
//  SegmentView
//
//  Created by 房品汇 on 16/4/15.
//  Copyright © 2016年 Lukcy. All rights reserved.
//

//#define SCREEN_WID [UIScreen mainScreen].bounds.size.width
//#define SCREEN_HEI [UIScreen mainScreen].bounds.size.height
#define defaultLineColor [UIColor blueColor]
#define selectTitleColor [UIColor orangeColor]
#define unselectTitleColor [UIColor blackColor]
#define titleFont [UIFont systemFontOfSize:16]
#import "SegmentView.h"

@interface SegmentView ()<UIScrollViewDelegate>

@property (nonatomic,strong) UIScrollView *titleScrollView;
@property (nonatomic,strong) NSArray *titleArray;
@property (nonatomic,strong) UIView *lineView;
@property (nonatomic,strong) UIScrollView *subViewScrollView;
@property (nonatomic,strong) NSMutableArray *btArray;

@end

@implementation SegmentView

-(instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArray selectType:(NSInteger)type viewType:(NSInteger)viewType{

    if (self = [super initWithFrame:frame]) {
        
        _titleArray = titleArray;
        _type = type;
        self.typeView = viewType;
        
        [self addSubview:self.titleScrollView];
        [self addSubview:self.subViewScrollView];
        
    }
    return self;
}
//- (instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArray selectType:(NSInteger)type{
//    
//    if (self = [super initWithFrame:frame]) {
//        
//        _titleArray = titleArray;
//        _type = type;
//        
//        [self addSubview:self.titleScrollView];
//        [self addSubview:self.subViewScrollView];
//        
//    }
//    return self;
//    
//}
- (void)setLineColor:(UIColor *)lineColor{
    
    _lineColor = lineColor;
    [_lineView setBackgroundColor:self.lineColor ? _lineColor : defaultLineColor];
}

- (UIScrollView *)titleScrollView{
    
    if (!_titleScrollView) {
        
        _titleScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WID, 30)];
        _titleScrollView.contentSize = CGSizeMake(SCREEN_WID*_titleArray.count/3, 0);
        _titleScrollView.scrollEnabled = YES;
        _titleScrollView.showsHorizontalScrollIndicator = YES;
        _titleScrollView.backgroundColor = [UIColor blueColor];
    }
    
    for (int i = 0; i<_titleArray.count; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button setFrame:CGRectMake(SCREEN_WID/2 + 80*(i - 1), 0, 80, 30)];
        [button setTitle:_titleArray[i] forState:UIControlStateNormal];
        [button.titleLabel setFont:titleFont];
        button.tag = i+10;
        
        i==0 ? [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal] : [button setTitleColor: [UIColor colorWithString:@"#daf2fc"] forState:UIControlStateNormal];
        
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_titleScrollView addSubview:button];
        [_btArray addObject:button];
    }
    
    _lineView = [[UIView alloc] initWithFrame:CGRectZero];
    [_lineView setBackgroundColor:self.lineColor ? _lineColor : defaultLineColor];
    
    if (self.type == 0) {
        
        _lineView.frame = CGRectMake(SCREEN_WID/2 - 80, CGRectGetHeight(_titleScrollView.frame)-2, 80, 2);
        [_titleScrollView addSubview:_lineView];
        
    }else{
        
        _lineView.frame = CGRectMake(SCREEN_WID/2 - 80, 0, 80, CGRectGetMaxX(_titleScrollView.frame));
        [_titleScrollView insertSubview:_lineView atIndex:0];
    }
    
    
    return _titleScrollView;
}

- (UIScrollView *)subViewScrollView{
    
    if (!_subViewScrollView) {
        
        _subViewScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 30, SCREEN_WID, SCREEN_HEI - 80)];
        _subViewScrollView.backgroundColor = [UIColor clearColor];
        _subViewScrollView.showsHorizontalScrollIndicator = NO;
        _subViewScrollView.showsVerticalScrollIndicator = NO;
        _subViewScrollView.contentSize = CGSizeMake(SCREEN_WID*_titleArray.count, 0);
        _subViewScrollView.delegate = self;
        _subViewScrollView.alwaysBounceVertical = NO;
        _subViewScrollView.pagingEnabled = YES;
        //方向锁
        _subViewScrollView.directionalLockEnabled = YES;
        
        NSArray *colorArr = @[[UIColor lightGrayColor],[UIColor cyanColor],[UIColor greenColor]];
        for (int i = 0; i<_titleArray.count; i++) {
            
            UIView *subview = [[UIView alloc] initWithFrame:CGRectMake(i*SCREEN_WID, 0, SCREEN_WID, SCREEN_HEI - 80)];
//            subview.backgroundColor = colorArr[i%colorArr.count];
            subview.backgroundColor = [UIColor clearColor];
            [_subViewScrollView addSubview:subview];

            if (i == 0) {
                UIView * applyView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WID, SCREEN_HEI - 80)];
                [applyView setBackgroundColor:[UIColor yellowColor]];
                [subview addSubview:applyView];
            }else{
                UIView * auditView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WID, SCREEN_HEI - 80)];
                [auditView setBackgroundColor:[UIColor redColor]];
                [subview addSubview:auditView];
            }
        }
    }
    
    return _subViewScrollView;
}
- (NSMutableArray *)btArray{
    
    if (!_btArray) {
        
        _btArray = [NSMutableArray array];
    }
    return _btArray;
}
- (void)buttonAction:(UIButton *)sender{
    
    [UIView animateWithDuration:0.3 animations:^{
        
        _lineView.frame = CGRectMake(sender.frame.origin.x, _lineView.frame.origin.y, _lineView.frame.size.width, _lineView.frame.size.height);
    }];
    for (int i = 0; i<_titleArray.count; i++) {
        UIButton *bt = (UIButton *)[_titleScrollView viewWithTag:10+i];
        sender.tag == (10+i) ? [bt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal] : [bt setTitleColor:[UIColor colorWithString:@"#daf2fc"] forState:UIControlStateNormal];
        
    }
    _subViewScrollView.contentOffset=CGPointMake(SCREEN_WID*(sender.tag-10), 0);
    
    switch (sender.tag) {
        case 10:
        {
            NSLog(@"点击了第%ld个",sender.tag-10);
        }
            break;
        case 11:
        {
            NSLog(@"点击了第%ld个",sender.tag-10);
        }
            break;
        case 12:
        {
            NSLog(@"点击了第%ld个",sender.tag-10);
        }
            break;
        default:
            break;
    }
    
    
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    CGFloat offSetX = scrollView.contentOffset.x;
    NSInteger index = offSetX/SCREEN_WID;
    UIButton *bt = (UIButton *)[self viewWithTag:(index+10)];
    _lineView.frame = CGRectMake(bt.frame.origin.x, _lineView.frame.origin.y, _lineView.frame.size.width, _lineView.frame.size.height);
    [bt setTitleColor:selectTitleColor forState:UIControlStateNormal];
    
    _titleScrollView.contentOffset = CGPointMake(index/4*SCREEN_WID, 0);
    
    for (int i = 0; i<_titleArray.count; i++) {
        UIButton *bt = (UIButton *)[_titleScrollView viewWithTag:10+i];
        10+index == (10+i) ? [bt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal] : [bt setTitleColor:[UIColor colorWithString:@"#daf2fc"] forState:UIControlStateNormal];
        
    }
    
    
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */


@end
