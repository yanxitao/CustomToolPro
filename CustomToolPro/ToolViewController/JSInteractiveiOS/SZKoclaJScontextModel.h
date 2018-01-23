//
//  SZKoclaJScontextModel.h
//  CustomTool
//
//  Created by 燕戏涛 on 2017/12/6.
//  Copyright © 2017年 yzhtech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol JSExportDelegate <JSExport>

- (void)share;
- (void)callBack;

@end


@protocol SZKoclaJScontextModelDelegate <NSObject>

- (void)share;
- (void)callBackTest;//这里的名字可以和JSExportDelegate不一致

@end


//首先创建一个实现了JSExport协议的协议
@protocol TestJSObjectProtocol <JSExport>

//此处我们测试几种参数的情况
-(void)TestNOParameter;
-(void)TestOneParameter:(NSString* )message;

@end


@interface SZKoclaJScontextModel : NSObject<JSExportDelegate, TestJSObjectProtocol>

@property (strong, nonatomic)JSContext *jsContext;
@property (weak, nonatomic)id<SZKoclaJScontextModelDelegate>delegate;

@end
