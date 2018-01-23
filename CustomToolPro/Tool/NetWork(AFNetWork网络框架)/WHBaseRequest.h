//
//  WHBaseRequest.h
//  yz-app
//
//  Created by 燕戏涛 on 16/3/22.
//  Copyright © 2016年 燕戏涛. All rights reserved.
//

#import "WHBaseObject.h"

#define QA

#ifdef              QA//测试环境


#define HOST                @"http://172.16.100.224:8080/jk2cloud-shop-server/ios"//联调地址
//#define HOST                @"http://222.128.2.58:19000/lgbeauty-iosapi/v1"//内部测试地址

#define URL(path, host)           [NSString stringWithFormat:@"%@%@",host,path]

#endif

@class WHBaseResponse;

@interface WHBaseRequest : WHBaseObject

@property(nonatomic, copy)      NSString        *url;
@property(nonatomic, copy)      NSString        *host;
@property(nonatomic, copy)      NSString        *path;
@property(nonatomic, copy)      NSString        *tokenId;
@property(nonatomic, copy)      NSString        *method;
@property(nonatomic, assign)    NSTimeInterval  timeoutInterval;

- (WHBaseResponse*) responseFromObject:(id)object;

- (NSDictionary*) parameters;

- (NSString*) jsonString;

- (NSDictionary*) customParameters;

@end
