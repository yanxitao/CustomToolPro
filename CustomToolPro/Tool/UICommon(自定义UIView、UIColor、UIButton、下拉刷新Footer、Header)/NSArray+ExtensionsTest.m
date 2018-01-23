//
//  NSArray+ExtensionsTest.m
//  CustomTool
//
//  Created by 燕戏涛 on 2017/12/1.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#import "NSArray+ExtensionsTest.h"

@implementation NSArray (ExtensionsTest)

+ (BOOL)writetargetStr:(NSString*)targetStr ToFilePath:(NSString *)path{
    //1.写入之前先读取已经存在过的数组
    NSArray *Arr =  [NSArray readFile:path];
    NSMutableArray *mutArr = [NSMutableArray arrayWithArray:Arr];
    //不加判断存进去空会崩溃
    if(!(targetStr.length>0&&targetStr))
        return   NO;
    [mutArr addObject:targetStr];
    NSString *path1 = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *newPath = [path1 stringByAppendingPathComponent:path];
    NSData * data = [NSKeyedArchiver archivedDataWithRootObject:mutArr];
    return [data writeToFile:newPath
                  atomically:YES];
}

+(NSArray*)readFile:(NSString*)path{
    NSString *path1 = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *newPath = [path1 stringByAppendingPathComponent:path];
    NSData * data = [NSData dataWithContentsOfFile:newPath];
    return  [NSKeyedUnarchiver unarchiveObjectWithData:data];
}

@end
