//
//  ToolCALayerAnimationViewController.m
//  CustomTool
//
//  Created by 燕戏涛 on 2017/11/1.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#import "ToolCALayerAnimationViewController.h"
#import "UIView+YXTTransform.h"
#import "ToolChangeBGColorOrImageViewController.h"
#import "ToolComplexAnimationViewController.h"

@interface ToolCALayerAnimationViewController ()

{
    NSArray                         *bgColorArr;
    NSArray                         *bgImageArr;
    UIButton                        *changeColorBtn;
    UIButton                        *changeImageBtn;
}

@end

@implementation ToolCALayerAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self creatGradientLayer];
    
    UIButton * pieChartBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [pieChartBtn setFrame:CGRectMake(0, 0, 200, 50)];
    [pieChartBtn setCenter:CGPointMake(SCREEN_WID/2, SCREEN_HEI/2 - 250)];
    [pieChartBtn setTitle:@"统计图" forState:UIControlStateNormal];
    [pieChartBtn setBackgroundColor:[UIColor grayColor]];
    pieChartBtn.layer.cornerRadius = 4;
    pieChartBtn.layer.masksToBounds = YES;
    [pieChartBtn addTarget:self action:@selector(pushToChangeBGColorOrImage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pieChartBtn];

    UIButton * complexAnimationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [complexAnimationBtn setFrame:CGRectMake(0, 0, 200, 50)];
    [complexAnimationBtn setCenter:CGPointMake(SCREEN_WID/2, SCREEN_HEI/2 - 180)];
    [complexAnimationBtn setTitle:@"酷炫动画" forState:UIControlStateNormal];
    [complexAnimationBtn setBackgroundColor:[UIColor grayColor]];
    complexAnimationBtn.layer.cornerRadius = 4;
    complexAnimationBtn.layer.masksToBounds = YES;
    [complexAnimationBtn addTarget:self action:@selector(pushToComplexAnimation) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:complexAnimationBtn];

}

//套环圆形
- (void)checkFillRule {
    
    UIBezierPath * path = [[UIBezierPath alloc] init];
    CGPoint circleCenter = self.view.center;
    [path moveToPoint:CGPointMake(circleCenter.x + 50, circleCenter.y)];
    [path addArcWithCenter:circleCenter radius:50 startAngle:0 endAngle:2*M_PI clockwise:YES];
    //    [path moveToPoint:CGPointMake(circleCenter.x + 70, circleCenter.y)];
    //    [path addArcWithCenter:circleCenter radius:70 startAngle:0 endAngle:2*M_PI clockwise:YES];
    [path moveToPoint:CGPointMake(circleCenter.x + 150, circleCenter.y)];
    [path addArcWithCenter:circleCenter radius:150 startAngle:0 endAngle:2*M_PI clockwise:YES];
    
    CAShapeLayer * shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor blueColor].CGColor;
    shapeLayer.fillColor = [UIColor greenColor].CGColor;
    shapeLayer.fillRule = kCAFillRuleEvenOdd;
    shapeLayer.lineWidth = 5;
    shapeLayer.lineJoin = kCALineJoinBevel;
    shapeLayer.lineCap = kCALineCapButt;
    shapeLayer.path = path.CGPath;
    
    [self.view.layer addSublayer:shapeLayer];
    
}

//边框折线
- (void)bezierLine {
    
    UIBezierPath * bezierPath = [UIBezierPath bezierPathWithRect:CGRectMake(30, 50, 100, 100)];
    bezierPath.lineWidth = 10;
    
    CAShapeLayer * shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = bezierPath.CGPath;
    shapeLayer.fillColor = [UIColor redColor].CGColor;
    shapeLayer.strokeColor = [UIColor greenColor].CGColor;
    shapeLayer.lineWidth = 10;
    shapeLayer.strokeStart = 0.5;
    shapeLayer.strokeEnd = 1;
    [self.view.layer addSublayer:shapeLayer];
    
}

//滚动的虚线框
-(void)dashLine {
    
    CAShapeLayer* dashLineShapeLayer = [CAShapeLayer layer];
    //创建贝塞尔曲线
    UIBezierPath* dashLinePath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 200, 100) cornerRadius:20];
    
    dashLineShapeLayer.path = dashLinePath.CGPath;
    dashLineShapeLayer.position = CGPointMake(100, 100);
    dashLineShapeLayer.fillColor = [UIColor clearColor].CGColor;
    dashLineShapeLayer.strokeColor = [UIColor whiteColor].CGColor;
    dashLineShapeLayer.lineWidth = 3;
    dashLineShapeLayer.lineDashPattern = @[@(6),@(6)];
    dashLineShapeLayer.strokeStart = 0;
    dashLineShapeLayer.strokeEnd = 1;
    dashLineShapeLayer.zPosition = 999;
    //
    [self.view.layer addSublayer:dashLineShapeLayer];
    
    //
    NSTimeInterval delayTime = 0.3f;
    //定时器间隔时间
    NSTimeInterval timeInterval = 0.1f;
    //创建子线程队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //使用之前创建的队列来创建计时器
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    //设置延时执行时间，delayTime为要延时的秒数
    dispatch_time_t startDelayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayTime * NSEC_PER_SEC));
    //设置计时器
    dispatch_source_set_timer(_timer, startDelayTime, timeInterval * NSEC_PER_SEC, 0.1 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(_timer, ^{
        //执行事件
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            CGFloat _add = 3;
            dashLineShapeLayer.lineDashPhase -= _add;
        });
    });
    // 启动计时器
    dispatch_resume(_timer);
    
}

-(void)creatGradientLayer{
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.bounds = CGRectMake(0, 0, 220, 220);
    gradientLayer.position = self.view.center;
    [self.view.layer addSublayer:gradientLayer];
    //
    NSMutableArray *colorArray = [NSMutableArray new];
    for (NSInteger hue = 0; hue <= 360; hue += 5) {
        UIColor *color = [UIColor colorWithHue:1.0*hue/360.0
                                    saturation:1.0
                                    brightness:1.0
                                         alpha:1.0];
        [colorArray addObject:(id)color.CGColor];
    }
    //
    gradientLayer.colors = colorArray;
    //gradientLayer.locations = @[@(0.3),@(0.7)];
    //
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 1);
    //ShapeLayer
    UIBezierPath *bezierP = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, 200, 200)];
    CAShapeLayer* shapeLayer = [[CAShapeLayer alloc] init];
    shapeLayer.path = bezierP.CGPath;
    shapeLayer.lineWidth = 10;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor = [UIColor blueColor].CGColor;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.strokeStart = 0;
    shapeLayer.strokeEnd = 0;
    gradientLayer.mask = shapeLayer;
    
    //
//    NSTimeInterval delayTime = 1.0f;
//    NSTimeInterval timeInterval = 0.5f;
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
//    dispatch_time_t startDelayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayTime * NSEC_PER_SEC));
//    dispatch_source_set_timer(_timer, startDelayTime, timeInterval * NSEC_PER_SEC, 0.1 * NSEC_PER_SEC);
//    dispatch_source_set_event_handler(_timer, ^{
//        dispatch_async(dispatch_get_main_queue(), ^{
//            if (shapeLayer.strokeEnd < 0.6) {
//                shapeLayer.strokeEnd += 0.4;
//            }else if (shapeLayer.strokeEnd < 0.8){
//                shapeLayer.strokeEnd += 0.2;
//            }else if (shapeLayer.strokeEnd < 1){
//                shapeLayer.strokeEnd += 0.1;
//            }else{
//                dispatch_source_cancel(_timer);
//            }
//        });
//    });
//    dispatch_resume(_timer);
}

- (void)pushToChangeBGColorOrImage {
    
    ToolChangeBGColorOrImageViewController * changeBG = [[ToolChangeBGColorOrImageViewController alloc] init];
    [self.navigationController pushViewController:changeBG animated:YES];

}

- (void)pushToComplexAnimation {
    
    ToolComplexAnimationViewController * complexAnimationVC = [[ToolComplexAnimationViewController alloc] init];
    [self.navigationController pushViewController:complexAnimationVC animated:YES];
    
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
