//
//  SZKoclaJScontextModel.m
//  CustomTool
//
//  Created by 燕戏涛 on 2017/12/6.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#import "SZKoclaJScontextModel.h"

@implementation SZKoclaJScontextModel

- (void)share {
    
    if ([self.delegate respondsToSelector:@selector(share)]) {
        [self.delegate share];
    }

}

-(void)callBack {
    
    if ([self.delegate respondsToSelector:@selector(callBackTest)]) {
        [self.delegate callBackTest];
    }
    
}

-(void)TestNOParameter {
    
    NSLog(@"this is ios TestNOParameter");
    
}

-(void)TestOneParameter:(NSString *)message {
    
    NSLog(@"this is ios TestOneParameter=%@",message);
    
}

@end
