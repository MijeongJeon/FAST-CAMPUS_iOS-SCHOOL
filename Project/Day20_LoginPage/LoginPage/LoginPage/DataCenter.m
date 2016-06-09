//
//  DataCenter.m
//  LoginPage
//
//  Created by Mijeong Jeon on 6/3/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "DataCenter.h"

@implementation DataCenter

+ (instancetype)sharedInstance {
    static DataCenter *dataCenter = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataCenter = [[self alloc] init];
    });
    return dataCenter;
}

// UserInfo.plist 경로 찾는 메소드
- (NSString *)findUserInfoPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = [paths objectAtIndex:0];
    NSString *docuPath = [basePath stringByAppendingPathComponent:@"UserInfo.plist"];
    
    return docuPath;
}

// UserInfo.plist파일에 번들 파일 복사 및 새 파일에 새로운 정보 추가
- (void)addUserInfoWithID:(NSString *)ID andPassword:(NSString *)password {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:[self findUserInfoPath]]) {
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"UserInfo" ofType:@"plist"];
        [fileManager copyItemAtPath:bundlePath toPath:[self findUserInfoPath] error:nil];
    }
    
    NSMutableArray *userInfos = [NSMutableArray arrayWithContentsOfFile:[self findUserInfoPath]];
    NSDictionary *newInfo = @{@"id":ID, @"password":password};
    [userInfos addObject:newInfo];
    [userInfos writeToFile:[self findUserInfoPath] atomically:NO];
}

// 입력된 ID와 Password가 가입되어있는 정보인지 확인
- (BOOL)isCheckLoginwithID:(NSString *)userID userPW:(NSString *)userPW {
    NSArray *infoArray = [NSArray arrayWithContentsOfFile:[[DataCenter sharedInstance] findUserInfoPath]];
    for (NSDictionary *infoDic in infoArray) {
        NSString *insertedID = [infoDic objectForKey:@"id"];
        NSString *insertedPW = [infoDic objectForKey:@"password"];
        if ([insertedID isEqualToString:userID] && [insertedPW isEqualToString:userPW]) {
            return YES;
        }
    }
    return NO;
}

// 입력된 ID가 가입되어있는 정보인지 확인
- (BOOL)isCheckLoginwithID:(NSString *)userID {
        NSArray *infoArray = [NSArray arrayWithContentsOfFile:[[DataCenter sharedInstance] findUserInfoPath]];
        for (NSDictionary *infoDic in infoArray) {
            NSString *insertedID = [infoDic objectForKey:@"id"];
            if ([insertedID isEqualToString:userID]) {
                return YES;
            }
        }
        return NO;
}

// 파일 정보 삭제
- (void)removeFileContents {
    [[NSFileManager defaultManager] removeItemAtPath:[self findUserInfoPath] error:nil];
}

// 오토로그인 정보 저장을 위한 userDefault 생성
+ (id)userDefaults {
    NSUserDefaults *autoLoginInfo = [NSUserDefaults standardUserDefaults];
    NSLog(@"userDefault가 불렸어요");
    return autoLoginInfo;
}


@end
