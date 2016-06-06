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
- (void)addUserInfoWithID:(NSString *)ID andEmail:(NSString *)email andPassword:(NSString *)password {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:[self findUserInfoPath]]) {
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"UserInfo" ofType:@"plist"];
        [fileManager copyItemAtPath:bundlePath toPath:[self findUserInfoPath] error:nil];
    }
    
    NSMutableArray *userInfos = [NSMutableArray arrayWithContentsOfFile:[self findUserInfoPath]];
    NSDictionary *newInfo = @{@"id":ID, @"email":email, @"password":password};
    [userInfos addObject:newInfo];
    [userInfos writeToFile:[self findUserInfoPath] atomically:NO];
}

// 파일 정보 삭제
- (void)removeFileContents {
    [[NSFileManager defaultManager] removeItemAtPath:[self findUserInfoPath] error:nil];
}

// 오토로그인 정보 저장을 위한 userDefault 생성
+ (id)setUserDefaults {
    NSUserDefaults *autoLoginInfo = [NSUserDefaults standardUserDefaults];
    NSLog(@"userDefault가 불렸어요");
    return autoLoginInfo;
}


@end
