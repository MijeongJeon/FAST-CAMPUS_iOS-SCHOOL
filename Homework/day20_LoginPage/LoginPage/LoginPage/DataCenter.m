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

- (NSArray *)findUserInfo {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = [paths objectAtIndex:0];
    NSString *docuPath = [basePath stringByAppendingPathComponent:@"UserInfo.plist"];
    
    NSArray *userInfos = [NSArray arrayWithContentsOfFile:docuPath];
    return userInfos;
}

- (void)addUserInfoWithID:(NSString *)ID andEmail:(NSString *)email andPassword:(NSString *)password {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = [paths objectAtIndex:0];
    NSString *docuPath = [basePath stringByAppendingPathComponent:@"UserInfo.plist"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:docuPath]) {
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"UserInfo" ofType:@"plist"];
        [fileManager copyItemAtPath:bundlePath toPath:docuPath error:nil];
    }
    
    NSMutableArray *userInfos = [NSMutableArray arrayWithContentsOfFile:docuPath];
    NSDictionary *newInfo = @{@"ID":ID, @"email":email, @"password":password};
    [userInfos addObject:newInfo];
    [userInfos writeToFile:docuPath atomically:NO];
    
}


@end
