//
//  YZHttpClient.h
//  yz-app
//
//  Created by 燕戏涛 on 16/3/22.
//  Copyright © 2016年 燕戏涛. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "AFHTTPRequestOperation.h"
#import "AFHTTPSessionManager.h"
#import "WHBaseObject.h"
#import "WHBaseRequest.h"
#import "WHBaseResponse.h"
#import "SVProgressHUD.h"
#import "JSONModel.h"

typedef void (^ResultSuccessHandler)(WHBaseResponse *response);
typedef void (^ResultFailureHandler)(WHBaseResponse *response);
typedef void (^ResultErrorHandler)(NSError *error);

static NSString *responseCodeSuccess                = @"";
static NSString *responseCodeSuccessEmpty           = @"";

@interface WHHttpClient : NSObject

+ (WHHttpClient *)shareInstance;

@property (nonatomic, strong) NSString          *YZTooken;

- (AFHTTPSessionManager *) connectWithPhotoRequest:(WHBaseRequest *)req
                                             image:(UIImage *)photoImage
                                      success:(ResultSuccessHandler)succesHandler
                                      failure:(ResultFailureHandler)failureHandler
                                        error:(ResultErrorHandler)errorHandler;

- (AFHTTPSessionManager *) connectWithRequest:(WHBaseRequest *)req
                                        success:(ResultSuccessHandler)succesHandler
                                        failure:(ResultFailureHandler)failureHandler
                                          error:(ResultErrorHandler)errorHandler;

- (AFHTTPSessionManager *)changePwDWithRequest:(NSString *)url
                                       success:(ResultSuccessHandler)succesHandler
                                       failure:(ResultFailureHandler)failureHandler
                                         error:(ResultErrorHandler)errorHandler;

- (AFHTTPSessionManager *) weatherWithRequest:(WHBaseRequest *)req
                                     success:(ResultSuccessHandler)succesHandler
                                     failure:(ResultFailureHandler)failureHandler
                                       error:(ResultErrorHandler)errorHandler;

- (AFHTTPSessionManager *) businessWithRequest:(WHBaseRequest *)req
                                      success:(ResultSuccessHandler)succesHandler
                                      failure:(ResultFailureHandler)failureHandler
                                        error:(ResultErrorHandler)errorHandler;

@end
