//
//  NSArray+ExtensionsTest.h
//  CustomTool
//
//  Created by 燕戏涛 on 2017/12/1.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (ExtensionsTest)

+ (BOOL)writetargetStr:(NSString*)targetStr ToFilePath:(NSString *)path ;
//读取到path下面(路径的一个唯一标示即可,可以1,2,3,...)的一个数组,底层会将path 拼接为真正的沙盒路径
+(NSArray*)readFile:(NSString*)path;

@end
