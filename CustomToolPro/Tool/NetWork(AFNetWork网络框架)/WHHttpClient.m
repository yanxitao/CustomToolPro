//
//  YZHttpClient.m
//  yz-app
//
//  Created by 燕戏涛 on 16/3/22.
//  Copyright © 2016年 燕戏涛. All rights reserved.
//

#import "WHHttpClient.h"
#import "AFNetworking.h"
//#import "WHUserInfo.h"
//#import "JKLoginResponse.h"

@implementation WHHttpClient

+ (WHHttpClient *) shareInstance{

    static WHHttpClient *instance = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
    
        instance = [[WHHttpClient alloc] initSingleton];
    });
    return instance;
}

- (id) initSingleton{

    if (self = [super init]) {
        
    }
    return self;
}

- (id) init{

    NSAssert(YES, @"can't call init for singleton class");
    return nil;
}

//打印请求数据
- (void) printRequese:(NSMutableURLRequest *)request{

    NSString *body = [[NSString alloc] initWithData:request.HTTPBody encoding:NSUTF8StringEncoding];
//    DMDebug(@"请求内容:%@", [body stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]);
}

//打印返回数据
//- (void) printResponse:(AFHTTPRequestOperation *)operation startDate:(NSData *)startDate error:(NSError *)error{
//
////    DMDebug(@"响应内容:%@", operation.responseString);
//}
//
////请求头设置
//- (void) configHttpHeaders:(NSMutableURLRequest *)request{
//
//    
//}
//
////请求操作
- (AFHTTPSessionManager *)weatherWithRequest:(WHBaseRequest *)req
                                       success:(ResultSuccessHandler)succesHandler
                                       failure:(ResultFailureHandler)failureHandler
                                         error:(ResultErrorHandler)errorHandler{

    AFHTTPSessionManager * session = [AFHTTPSessionManager manager];
    session.requestSerializer.timeoutInterval = 10;

    [session POST:req.url parameters:req.parameters success:^(NSURLSessionDataTask * _Nonnull task, id responseObject) {
    
        NSLog(@"%@", responseObject);
        if ([[responseObject objectForKey:@"resultcode"] intValue] == 105) {
            failureHandler(responseObject);
        }else {
            succesHandler(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failureHandler(nil);

    }];
    
//    [session POST:req.url parameters:req.parameters progress:^ (NSProgress *  _Nonnull uploadProgress){
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id responseObject){
//        
//        NSLog(@"%@", responseObject);
//        if ([[responseObject objectForKey:@"resultcode"] intValue] == 105) {
//            failureHandler(responseObject);
//        }else {
//            succesHandler(responseObject);
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error){
//        failureHandler(nil);
//    }];
    
    return session;

}

////请求操作
- (AFHTTPSessionManager *)changePwDWithRequest:(NSString *)url
                                     success:(ResultSuccessHandler)succesHandler
                                     failure:(ResultFailureHandler)failureHandler
                                       error:(ResultErrorHandler)errorHandler{
    
    AFHTTPSessionManager * session = [AFHTTPSessionManager manager];
    session.requestSerializer.timeoutInterval = 10;
    
    
    [session GET:url parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id responseObject){
        
        NSLog(@"%@", responseObject);
        if ([[responseObject objectForKey:@"resultcode"] intValue] == 105) {
            failureHandler(responseObject);
        }else {
            succesHandler(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error){
        
        NSLog(@"%@", [error.userInfo objectForKey:@"com.alamofire.serialization.response.error.response"]);
        
        NSHTTPURLResponse * errorResponse = [error.userInfo objectForKey:@"/Users/yanxitao/Desktop/bjeeaoa-app-ios/bjeeaoa/bjeeaoa/Sources/Pages/OfficeNetWorkViewController/YZOfficeNetViewController.mcom.alamofire.serialization.response.error.response"];
        NSString * errorStr = [self getErrorStringWithResponse:errorResponse Error:error];
        
        failureHandler((WHBaseResponse *)errorStr);
    }];
    
    return session;
    
}

////请求操作
- (AFHTTPSessionManager *)connectWithRequest:(WHBaseRequest *)req
                                     success:(ResultSuccessHandler)succesHandler
                                     failure:(ResultFailureHandler)failureHandler
                                       error:(ResultErrorHandler)errorHandler{

//sessionId添加
//    NSString * tempSessionId = [YZUserDefaultManager sharedInstance].sessionId;
//    NSData * data = (NSData *)[YZUserDefaultManager sharedInstance].loginInfoData;
//    JKLoginResponse * loginInfo = [NSKeyedUnarchiver unarchiveObjectWithData:data];

    AFHTTPSessionManager * session = [AFHTTPSessionManager manager];
    session.requestSerializer.timeoutInterval = 30;
//    [session.requestSerializer setValue:loginInfo.userMap.tokenId forHTTPHeaderField:@"tokenId"];
    
//    NSDictionary * reqDic = @{@"creater":@"sys"};
//    JSONModel * jsonModel = [[JSONModel alloc] init];
//    NSData * reqData = [req toJSONData];
    if ([req.method isEqualToString:@"POST"]) {
        NSData * data = [NSJSONSerialization dataWithJSONObject:req.parameters options:NSJSONWritingPrettyPrinted error:nil];
        
//        NSString * dataJson = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        AFURLSessionManager * manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        NSMutableURLRequest * currRequest = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:req.url parameters:nil error:nil];
        currRequest.timeoutInterval = [[[NSUserDefaults standardUserDefaults] valueForKey:@"timeoutInterval"] longValue];
        [currRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [currRequest setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//        [currRequest setValue:loginInfo.employee.tokenId forHTTPHeaderField:@"tokenId"];

//        [currRequest setValue:@"" forHTTPHeaderField:@"sessionId"];
        [currRequest setHTTPBody:data];
        
        [[manager dataTaskWithRequest:currRequest completionHandler:^(NSURLResponse * _Nonnull response, id _Nullable responseObject, NSError * _Nullable error) {
            if (!error) {
                WHBaseResponse * response = [req responseFromObject:responseObject];
                NSLog(@"%@", response);
                succesHandler(response);
            }else {
                NSLog(@"%@", error);
                NSHTTPURLResponse * errorResponse = [error.userInfo objectForKey:@"com.alamofire.serialization.response.error.response"];
                NSString * errorStr = [self getErrorStringWithResponse:errorResponse Error:error];
                failureHandler(errorStr);
            }
        }] resume];
        
    } else if ([req.method isEqualToString:@"GET"]) {
    
        [session GET:req.url parameters:req.parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            WHBaseResponse * response = [req responseFromObject:responseObject];
            
            succesHandler(response);

        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            NSHTTPURLResponse * errorResponse = [error.userInfo objectForKey:@"com.alamofire.serialization.response.error.response"];
            
            NSString * errorStr;
            
            if (errorResponse) {
                errorStr = [self getErrorStringWithResponse:errorResponse Error:error];
            }else {
                if ([[error.userInfo objectForKey:@"Code"] isEqualToString:@"-1022"]) {
                    errorStr = @"未连接到服务器";
                }else {
                    errorStr = [error.userInfo objectForKey:@"NSLocalizedDescription"];
                }
            }
            
            NSLog(@"%@", errorStr);
            
            failureHandler(errorStr);

        }];
//        [session GET:req.url parameters:req.parameters success:^(NSURLSessionDataTask * _Nonnull task, id responseObject){
//            
//            //        NSLog(@"%@", responseObject);
//            WHBaseResponse * response = [req responseFromObject:responseObject];
//            
//            succesHandler(response);
//
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error){
//            
//            NSHTTPURLResponse * errorResponse = [error.userInfo objectForKey:@"com.alamofire.serialization.response.error.response"];
////            NSHTTPURLResponse * errorResponse = [error.userInfo objectForKey:@"com.alamofire.serialization.response.error.data"];
//
////            NSData *responseData = nil;
////            NSError *underlyingError = error.userInfo[NSUnderlyingErrorKey];
////            if (underlyingError) {
////                responseData = underlyingError.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey];
////            } else {
////                responseData = error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey];
////            }
////            NSString *errorString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
////            errorString = (errorString && errorString.length) ? errorString : nil;
//
//            NSString * errorStr;
//            
//            if (errorResponse) {
//                errorStr = [self getErrorStringWithResponse:errorResponse Error:error];
//            }else {
//                if ([[error.userInfo objectForKey:@"Code"] isEqualToString:@"-1022"]) {
//                    errorStr = @"未连接到服务器";
//                }else {
//                    errorStr = [error.userInfo objectForKey:@"NSLocalizedDescription"];
//                }
//            }
//            
//            NSLog(@"%@", errorStr);
//
//            failureHandler(errorStr);
//        }];
    }
    
    return session;
    
}

//- (AFHTTPRequestOperationManager *)connectWithPhotoRequest:(WHBaseRequest *)req image:(UIImage *)photoImage success:(ResultSuccessHandler)succesHandler failure:(ResultFailureHandler)failureHandler error:(ResultErrorHandler)errorHandler {
//
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
//    manager.requestSerializer.timeoutInterval = 10.0f;
//    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
//    // 不让AFNetworking自动解析下载下来的内容
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    
//    [manager POST:req.url parameters:req.parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//        
//        NSData *imageData = UIImageJPEGRepresentation(photoImage, 0.5);
//        [formData appendPartWithFileData:imageData name:@"file" fileName:nil mimeType:@"image/png"];
//        
//    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//    }];
//    
//    return manager;
//}

- (NSData *)returnDataWithDictionary:(NSDictionary*)dict
{
    NSMutableData *data = [[NSMutableData alloc]init];
    NSKeyedArchiver* archiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    [archiver encodeObject:dict forKey:@"talkData"];
    [archiver finishEncoding];
    return data;
}

- (NSString *)getErrorStringWithResponse:(NSHTTPURLResponse *)httpURLResponse Error:(NSError *)error {
    
    if (httpURLResponse.statusCode == 500) {
        NSData *responseData = nil;
        NSError *underlyingError = error.userInfo[NSUnderlyingErrorKey];
        if (underlyingError) {
            responseData = underlyingError.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey];
        } else {
            responseData = error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey];
        }
        NSString *errorString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
        errorString = (errorString && errorString.length) ? errorString : nil;
        return errorString;
    }
    if (httpURLResponse.statusCode == 404) {
        return @"未找到服务";
    }
    if (httpURLResponse.statusCode == 403) {
        return @"拒绝请求";
    }
    if (httpURLResponse.statusCode == 400) {
        NSLog(@"请求参数错误");
        return nil;
    }
    return nil;
}

@end
