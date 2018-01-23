//
//  YZUserDefaults.m
//  bjeeaoa
//
//  Created by 燕戏涛 on 16/6/2.
//  Copyright © 2016年 yzhtech. All rights reserved.
//

#import "YZUserDefaultManager.h"
//#import "JSONModel.h"
//#import "JSONModelClassProperty.h"
//#import "JSONModelArray.h"

//static NSString *key_permission = @"permission";
//static NSString *key_colleagueDataArr = @"colleagueDataArr";
static NSString *key_topContactList = @"topContactList";
static NSString *key_patientListArr = @"patientListArr";
//static NSString *key_loginInfoData = @"loginInfoData";
//static NSString *key_historyEnterpriseNumArr = @"historyEnterpriseNumArr";
//static NSString *key_patientCasesListArr = @"patientCasesListArr";
//static NSString *key_patientCouponsListArr = @"patientCouponsListArr";

//static NSString *key_loginInfo = @"loginInfo";
//static NSString *key_categoryListArr = @"categoryListArr";
//static NSString *key_defectTypeListArr = @"defectTypeListArr";
//static NSString *key_defectItemListArr = @"defectItemListArr";
//static NSString *key_deviceToken = @"deviceToken";
//static NSString *key_tagsDic = @"tagsDic";
//static NSString *key_tagsArr = @"tagsArr";

//static NSString *key_patientLocationListArr = @"patientLocationListArr";
//static NSString *key_isFirstRequest = @"isFirstRequest";
static NSString *key_sessionId = @"sessionId";
//static NSString *key_preLoginInfo = @"preLoginInfo";
//static NSString *key_patientLastModifyTime = @"patientLastModifyTime";
//static NSString *key_filterInfoData = @"filterInfoData";

@implementation YZUserDefaultManager

SYNTHESIZE_SINGLETON_FOR_CLASS(YZUserDefaultManager)

- (instancetype)init {

    self = [super init];
    if (self) {
        userdefaults = [NSUserDefaults standardUserDefaults];
        [userdefaults removeObjectForKey:key_topContactList];
    }
    return self;
}

//- (void)setLoginInfo:(LGLoginResponse *)loginInfo {
//
//    NSData * data = [NSKeyedArchiver archivedDataWithRootObject:loginInfo];
//        [userdefaults setObject:data forKey:key_loginInfo];
//        [userdefaults synchronize];
//}
//
//- (LGLoginResponse *)loginInfo {
//
//    return [userdefaults objectForKey:key_loginInfo];
//}
//
- (void)setPatientListArr:(NSArray *)patientListArr {

    NSData * data = [NSKeyedArchiver archivedDataWithRootObject:patientListArr];
    [userdefaults setObject:data forKey:key_patientListArr];
    [userdefaults synchronize];
}

- (NSArray *)patientListArr {

    return [userdefaults objectForKey:key_patientListArr];
}

//- (void)setLoginInfoData:(JKLoginResponse *)loginInfoData {
//
//    NSData * data = [NSKeyedArchiver archivedDataWithRootObject:loginInfoData];
//    [userdefaults setObject:data forKey:key_loginInfoData];
//    [userdefaults synchronize];
//
//}
//
//- (JKLoginResponse *)loginInfoData {
//
//    return [userdefaults objectForKey:key_loginInfoData];;
//}

//- (void)setSessionId:(NSString *)sessionId {
//
//    [userdefaults setValue:sessionId forKey:key_sessionId];
//    [userdefaults synchronize];
//
//}
//
//- (NSString *)sessionId {
//
//    return [userdefaults objectForKey:key_sessionId];
//
//}
//
//- (void)setHistoryEnterpriseNumArr:(NSArray *)historyEnterpriseNumArr {
//
//    NSData * data = [NSKeyedArchiver archivedDataWithRootObject:historyEnterpriseNumArr];
//    [userdefaults setObject:data forKey:key_historyEnterpriseNumArr];
//    [userdefaults synchronize];
//
//}
//
//- (NSArray *)historyEnterpriseNumArr {
//
//    return [userdefaults objectForKey:key_historyEnterpriseNumArr];
//}

//
//- (void)setPatientCasesListArr:(NSArray *)patientCasesListArr {
//
//    NSData * data = [NSKeyedArchiver archivedDataWithRootObject:patientCasesListArr];
//    [userdefaults setObject:data forKey:key_patientCasesListArr];
//    [userdefaults synchronize];
//}
//
//- (NSArray *)patientCasesListArr {
//
//    return [userdefaults objectForKey:key_patientCasesListArr];
//}
//
//- (void)setPatientCouponsListArr:(NSArray *)patientCouponsListArr {
//
//    NSData * data = [NSKeyedArchiver archivedDataWithRootObject:patientCouponsListArr];
//    [userdefaults setObject:data forKey:key_patientCouponsListArr];
//    [userdefaults synchronize];
//}
//
//- (NSArray *)patientCouponsListArr {
//
//    return [userdefaults objectForKey:key_patientCouponsListArr];
//}
//
//- (void)setCategoryListArr:(NSArray *)categoryListArr {
//
//    NSData * data = [NSKeyedArchiver archivedDataWithRootObject:categoryListArr];
//    [userdefaults setObject:data forKey:key_categoryListArr];
//    [userdefaults synchronize];
//}
//
//- (NSArray *)categoryListArr {
//
//    return [userdefaults objectForKey:key_categoryListArr];
//}
//
//- (void)setDefectTypeListArr:(NSArray *)defectTypeListArr {
//
//    NSData * data = [NSKeyedArchiver archivedDataWithRootObject:defectTypeListArr];
//    [userdefaults setObject:data forKey:key_defectTypeListArr];
//    [userdefaults synchronize];
//}
//
//- (NSArray *)defectTypeListArr {
//
//    return [userdefaults objectForKey:key_defectTypeListArr];
//}
//
//- (void)setDefectItemListArr:(NSArray *)defectItemListArr {
//
//    NSData * data = [NSKeyedArchiver archivedDataWithRootObject:defectItemListArr];
//    [userdefaults setObject:data forKey:key_defectItemListArr];
//    [userdefaults synchronize];
//}
//
//- (NSArray *)defectItemListArr {
//
//    return [userdefaults objectForKey:key_defectItemListArr];
//}
//
//- (void)setDeviceToken:(NSString *)deviceToken {
//
//    [userdefaults setValue:deviceToken forKey:key_deviceToken];
//    [userdefaults synchronize];
//}
//
//- (NSString *)deviceToken {
//
//    return [userdefaults objectForKey:key_deviceToken];
//}
//
//- (void)setPatientLocationListArr:(NSArray *)patientLocationListArr {
//
//    NSData * data = [NSKeyedArchiver archivedDataWithRootObject:patientLocationListArr];
//    [userdefaults setObject:data forKey:key_patientLocationListArr];
//    [userdefaults synchronize];
//}
//
//- (NSArray *)patientLocationListArr {
//
//    return [userdefaults objectForKey:key_patientLocationListArr];
//}
//
//- (void)setIsFirstRequest:(NSString *)isFirstRequest {
//
//    [userdefaults setValue:isFirstRequest forKey:key_isFirstRequest];
//    [userdefaults synchronize];
//}
//
//- (NSString *)isFirstRequest {
//
//    return [userdefaults objectForKey:key_isFirstRequest];
//}
//
//- (void)setTokenId:(NSString *)tokenId {
//
//    [userdefaults setValue:tokenId forKey:key_tokenId];
//    [userdefaults synchronize];
//}
//
//- (NSString *)tokenId {
//
//    return [userdefaults objectForKey:key_tokenId];
//}
//
//- (void)setPreLoginInfo:(NSString *)preLoginInfo {
//
//    [userdefaults setValue:preLoginInfo forKey:key_preLoginInfo];
//    [userdefaults synchronize];
//}
//
//- (NSString *)preLoginInfo {
//
//    return [userdefaults objectForKey:key_preLoginInfo];
//}
//
//- (void)setPatientLastModifyTime:(NSString *)patientLastModifyTime {
//
//    [userdefaults setValue:patientLastModifyTime forKey:key_patientLastModifyTime];
//    [userdefaults synchronize];
//
//}
//
//- (NSString *)patientLastModifyTime {
//
//    return [userdefaults objectForKey:key_patientLastModifyTime];
//
//}
//
//- (void)setFilterInfoData:(LGFilterInfoData *)filterInfoData {
//
//    NSData * data = [NSKeyedArchiver archivedDataWithRootObject:filterInfoData];
//    [userdefaults setObject:data forKey:key_filterInfoData];
//    [userdefaults synchronize];
//
//}
//
//- (LGFilterInfoData *)filterInofData {
//
//    return [userdefaults objectForKey:key_filterInfoData];
//
//}

//- setisf
//    [userdefaults setValue:isFirstRequest forKey:key_isFirstRequest];
//    [userdefaults synchronize];
//}


//- (void)setTagsDic:(NSMutableDictionary *)tagsDic {
//
//    NSData * data = [NSKeyedArchiver archivedDataWithRootObject:tagsDic];
//    [userdefaults setValue:data forKey:key_tagsDic];
//    [userdefaults synchronize];
//}
//
//- (NSMutableDictionary *)tagsDic {
//
//    return [userdefaults objectForKey:key_tagsDic];
//}
//
//- (void)setTagsArr:(NSArray *)tagsArr {
//
//    NSData * data = [NSKeyedArchiver archivedDataWithRootObject:tagsArr];
//    [userdefaults setObject:data forKey:key_tagsArr];
//    [userdefaults synchronize];
//}
//
//- (NSArray *)tagsArr {
//
//    return [userdefaults objectForKey:key_tagsArr];
//
//}


//- (void)setDepartmentArr:(NSArray *)departmentArr {
//
//    [userdefaults setObject:departmentArr forKey:key_departmentArr];
//    [userdefaults synchronize];
//}
//
//- (NSArray *)departmentArr {
//
//    return [userdefaults objectForKey:key_departmentArr];
//
//}

//- (void)setPermission:(NSInteger)permission {
//
//    [userdefaults setObject:[NSString stringWithFormat:@"%ld", permission] forKey:key_permission];
//    [userdefaults synchronize];
//}
//
//- (NSInteger)permission {
//
//    return [[userdefaults objectForKey:key_permission] intValue];
//}

@end
