//
//  ToolComplexAnimationViewController.m
//  CustomTool
//
//  Created by 燕戏涛 on 2017/11/3.
//  Copyright © 2017年 yzhtech. All rights reserved.
//
#pragma mark CAEmitterLayer && CAEmitterCell
/*
 CAEmitterLayer 属性介绍
 
 birthRate:粒子产生系数，默认1.0；
 
 emitterCells: 装着CAEmitterCell对象的数组，被用于把粒子投放到layer上；
 
 emitterDepth:决定粒子形状的深度联系：emittershape
 
 emitterMode:发射模式
 NSString * const kCAEmitterLayerPoints;
 NSString * const kCAEmitterLayerOutline;
 NSString * const kCAEmitterLayerSurface;
 NSString * const kCAEmitterLayerVolume;
 
 
 emitterPosition:发射位置
 
 emitterShape:发射源的形状：
 NSString * const kCAEmitterLayerPoint;
 NSString * const kCAEmitterLayerLine;
 NSString * const kCAEmitterLayerRectangle;
 NSString * const kCAEmitterLayerCuboid;
 NSString * const kCAEmitterLayerCircle;
 NSString * const kCAEmitterLayerSphere;
 
 
 emitterSize:发射源的尺寸大；
 
 emitterZposition:发射源的z坐标位置；
 
 lifetime:粒子生命周期
 
 preservesDepth:不是多很清楚（粒子是平展在层上）
 
 renderMode:渲染模式：
 NSString * const kCAEmitterLayerUnordered;
 NSString * const kCAEmitterLayerOldestFirst;
 NSString * const kCAEmitterLayerOldestLast;
 NSString * const kCAEmitterLayerBackToFront;
 NSString * const kCAEmitterLayerAdditive;
 
 
 scale:粒子的缩放比例：
 
 seed：用于初始化随机数产生的种子
 
 spin:自旋转速度
 
 velocity：粒子速度
 */


#import "ToolComplexAnimationViewController.h"

@interface ToolComplexAnimationViewController ()

@property (nonatomic, strong)       CAEmitterLayer                      *emitterLayer;

@end

@implementation ToolComplexAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self startCAEmitterLayer];
}

- (void)startCAEmitterLayer {
    // EmitterLayer
    
    CGRect showRect = self.view.bounds;
    UIView *view = [[UIView alloc] initWithFrame:showRect];
    view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:view];
    
    self.emitterLayer = [CAEmitterLayer layer];
    self.emitterLayer.frame = view.bounds;
    self.emitterLayer.masksToBounds = YES;
    self.emitterLayer.emitterShape = kCAEmitterLayerLine;
    self.emitterLayer.emitterMode = kCAEmitterLayerSurface;
    self.emitterLayer.emitterSize = showRect.size;
    self.emitterLayer.emitterPosition = CGPointMake(showRect.size.width / 2.f, - 20);
    [self setEmitterCell];
    [view.layer addSublayer:self.emitterLayer];
}

/*
 CAEmitterCell 属性介绍
 
 CAEmitterCell类代表从CAEmitterLayer射出的粒子；emitter cell定义了粒子发射的方向。
 
 alphaRange:  一个粒子的颜色alpha能改变的范围；
 
 alphaSpeed:粒子透明度在生命周期内的改变速度；
 
 birthrate：粒子参数的速度乘数因子；每秒发射的粒子数量
 
 blueRange：一个粒子的颜色blue 能改变的范围；
 
 blueSpeed: 粒子blue在生命周期内的改变速度；
 
 color:粒子的颜色
 
 contents：是个CGImageRef的对象,既粒子要展现的图片；
 
 contentsRect：应该画在contents里的子rectangle：
 
 emissionLatitude：发射的z轴方向的角度
 
 emissionLongitude:x-y平面的发射方向
 
 emissionRange；周围发射角度
 
 emitterCells：粒子发射的粒子
 
 enabled：粒子是否被渲染
 
 greenrange: 一个粒子的颜色green 能改变的范围；
 
 greenSpeed: 粒子green在生命周期内的改变速度；
 
 lifetime：生命周期
 
 lifetimeRange：生命周期范围      lifetime= lifetime(+/-) lifetimeRange
 
 magnificationFilter：不是很清楚好像增加自己的大小
 
 minificatonFilter：减小自己的大小
 
 minificationFilterBias：减小大小的因子
 
 name：粒子的名字
 
 redRange：一个粒子的颜色red 能改变的范围；
 
 redSpeed; 粒子red在生命周期内的改变速度；
 
 scale：缩放比例：
 
 scaleRange：缩放比例范围；
 
 scaleSpeed：缩放比例速度：
 
 spin：子旋转角度
 
 spinrange：子旋转角度范围
 
 style：不是很清楚：
 
 velocity：速度
 
 velocityRange：速度范围
 
 xAcceleration:粒子x方向的加速度分量
 
 yAcceleration:粒子y方向的加速度分量
 
 zAcceleration:粒子z方向的加速度分量
 
 emitterCells:粒子发射的粒子
 
 注意：粒子同样有emitterCells属性，也就是说粒子同样可以发射粒子。
 */
- (void)setEmitterCell {
    CAEmitterCell *rainflake = [CAEmitterCell  emitterCell];
    rainflake.birthRate = 5.f;
    rainflake.speed = 10.f;
    rainflake.velocity        = 10.f;
    rainflake.velocityRange   = 10.f;
    rainflake.yAcceleration   = 1000.f;
    rainflake.contents        = (__bridge id)([UIImage imageNamed:@"decrease720"].CGImage);
    rainflake.color           = [UIColor whiteColor].CGColor;
    rainflake.lifetime        = 160.f;
    rainflake.scale           = 0.2f;
    rainflake.scaleRange      = 0.f;
    
    
    CAEmitterCell *snowflake  = [CAEmitterCell emitterCell];
    snowflake.birthRate       = 1.f;
    snowflake.speed           = 10.f;
    snowflake.velocity        = 2.f;
    snowflake.velocityRange   = 10.f;
    snowflake.yAcceleration   = 10.f;
    snowflake.emissionRange   = 0.5 * M_PI;
    snowflake.spinRange       = 0.25 * M_PI;
    snowflake.contents        = (__bridge id)([UIImage imageNamed:@"increaase720"].CGImage);
    snowflake.color           = [UIColor cyanColor].CGColor;
    snowflake.lifetime        = 160.f;
    snowflake.scale           = 0.5;
    snowflake.scaleRange      = 0.3;
    //添加到EmitterLayer中
    self.emitterLayer.emitterCells = @[snowflake,rainflake];
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
