//
//  YZBaseObject.h
//  yz-app
//
//  Created by 燕戏涛 on 16/3/22.
//  Copyright © 2016年 燕戏涛. All rights reserved.
//

#import "JSONModel.h"
#import <objc/runtime.h>

@interface WHBaseObject : JSONModel

- (NSArray *)getAllProperties;

- (NSDictionary *)properties_aps:(BOOL)hasValue;

@end
