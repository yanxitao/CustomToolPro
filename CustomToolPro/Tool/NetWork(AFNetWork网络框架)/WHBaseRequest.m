//
//  WHBaseRequest.m
//  yz-app
//
//  Created by 燕戏涛 on 16/3/22.
//  Copyright © 2016年 燕戏涛. All rights reserved.
//

#import "WHBaseRequest.h"
#import "WHBaseResponse.h"


//#import "WHUserInfo.h"

@implementation WHBaseRequest

+ (BOOL)propertyIsIgnored:(NSString *)propertyName{

    if([propertyName isEqualToString:@"url"]||
       [propertyName isEqualToString:@"path"]||
       [propertyName isEqualToString:@"method"]||
       [propertyName isEqualToString:@"host"]||
       [propertyName isEqualToString:@"timeoutInterval"])
        
        return YES;
    
    return NO;
}

- (WHBaseResponse *)responseFromObject:(id)object{

    NSString *className = NSStringFromClass([self class]);
    className = [className stringByReplacingOccurrencesOfString:@"Request" withString:@"Response"];
    Class class = NSClassFromString(className);
    
    NSError * error;
    WHBaseResponse * response;

//    if ([className isEqualToString:@"WHSubwayTVResponse"]) {
//            
////        response = [self subwayTVForObject:object];
//    }
//    else {
//    
//        response = [[class alloc] initWithDictionary:object error:&error];
//    }
    
    if ([object isKindOfClass:[NSArray class]]) {
        
        return object;
        
    }else {
        
        response = [[class alloc] initWithDictionary:object error:&error];
        return response;

    }
    
}

- (NSDictionary *)parameters{

    return [self toDictionary];
}

- (NSString *)jsonString{

    return [self toJSONString];
}

- (NSDictionary*) customParameters{
    
    NSString *json = [self jsonString];
    return @{@"param":json};
}

- (NSString *)url{

    return URL(self.path, self.host);
}

- (NSString *)host{

    return HOST;
}

- (NSString *)path{

    return @"";
}

-(NSString *)method{

    return self.method;
}

- (NSTimeInterval)timeoutInterval{

    if (_timeoutInterval > 0.0) {
        return _timeoutInterval;
    }else{
        return 10.0;
    }
}


//- (WHBaseResponse *)getSiteExitsBySiteIdForObject:(id)object {
//    
//    NSError * error;
//    WHBaseResponse * response;
//    
//    NSArray * listDataArr = [[NSArray alloc] init];
//    NSMutableArray * tempArr = [[NSMutableArray alloc] init];
//    
//    for (NSDictionary * jsonData in [object objectForKey:@"dataList"]) {
//        
//        WHGetSiteExitsBySiteIdData * data = [[WHGetSiteExitsBySiteIdData alloc] initWithDictionary:jsonData error:&error];
//        [tempArr addObject:data];
//    }
//    
//    listDataArr = [tempArr copy];
//    response = (id)listDataArr;
//    
//    return response;
//}
//
@end
