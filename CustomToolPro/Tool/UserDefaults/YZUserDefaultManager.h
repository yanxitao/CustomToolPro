//
//  YZUserDefaults.h
//  bjeeaoa
//
//  Created by 燕戏涛 on 16/6/2.
//  Copyright © 2016年 yzhtech. All rights reserved.
//

#import <Foundation/Foundation.h>

//#import "JKLoginResponse.h"
//#import "LGLoginResponse.h"
//#import "LGGetPatientResponse.h"
//#import "LGPatientInfoData.h"
//#import "LGPatientListInfoData.h"
//#import "LGMeInfoData.h"
//#import "LGPatientBookingServiceInfoData.h"
//#import "LGFilterInfoData.h"

static NSString * itemStyleData;
static NSString * inComeData;
static NSString * percentData;
static NSString * itemStyleTag;
static NSString * treatmentStyleData;
static NSString * treatmentNumData;
static NSString * treatmentStyleTag;
//static NSString * treatmentStyleData;

@interface YZUserDefaultManager : NSObject
{

    NSUserDefaults          *userdefaults;
}

SYNTHESIZE_SINGLETON_FOR_CLASS_HEADER(YZUserDefaultManager)

//@property (nonatomic, strong)           LGLoginResponse             *loginInfo;
@property (nonatomic, strong)           NSArray                     *patientListArr;
@property (nonatomic, strong)           NSString                    *sessionId;
//@property (nonatomic, strong)           JKLoginResponse             *loginInfoData;
//@property (nonatomic, strong)           NSArray                     *historyEnterpriseNumArr;

//@property (nonatomic, strong)           NSArray                     *patientCasesListArr;
//@property (nonatomic, strong)           NSArray                     *patientCouponsListArr;
//@property (nonatomic, strong)           NSArray                     *categoryListArr;
//@property (nonatomic, strong)           NSArray                     *defectTypeListArr;
//@property (nonatomic, strong)           NSArray                     *defectItemListArr;
//@property (nonatomic, strong)           NSString                    *deviceToken;
//@property (nonatomic, strong)           NSMutableDictionary         *tagsDic;
//@property (nonatomic, strong)           NSArray                     *tagsArr;
//@property (nonatomic, assign)           NSInteger                   segmentIndex;
//@property (nonatomic, strong)           NSIndexPath                 *currIndexPath;
//@property (nonatomic, strong)           LGPatientListInfoData       *changedPatientInfo;
//
//@property (nonatomic, strong)           NSArray                     *patientLocationListArr;
//@property (nonatomic, strong)           NSString                    *isFirstRequest;
////@property (nonatomic, strong)           NSString                    *isFirstOpen;
//@property (nonatomic, strong)           NSString                    *preLoginInfo;
//@property (nonatomic, strong)           NSString                    *patientLastModifyTime;
//
//@property (nonatomic, strong)           NSString                    *appointmentBookingTypeStr;
//@property (nonatomic, strong)           NSString                    *appointmentDateStr;
//@property (nonatomic, strong)           NSString                    *appointmentDateStrWithoutOther;
//@property (nonatomic, strong)           NSString                    *appointmentTimeStr;
//@property (nonatomic, strong)           NSString                    *searchPatientName;
//@property (nonatomic, strong)           NSString                    *searchPatientPhoneNum;
//@property (nonatomic, strong)           NSString                    *searchPatientPatientId;
//@property (nonatomic, strong)           NSString                    *appointmentMemo;
//@property (nonatomic, strong)           LGMeInfoData                *selectedEmployeeInfo;
//@property (nonatomic, strong)           LGMeInfoData                *selectedDoctorInfo;
//@property (nonatomic, strong)           LGPatientBookingServiceInfoData     *selectedServiceInfo;
//@property (nonatomic, strong)           NSString                    *selectCancelCauseStr;
//@property (nonatomic, strong)           NSString                    *addAppointmentMemoStr;
//@property (nonatomic, strong)           LGFilterInfoData            *filterInfoData;

//@property (nonatomic, strong)                               *deviceToken;

@end
