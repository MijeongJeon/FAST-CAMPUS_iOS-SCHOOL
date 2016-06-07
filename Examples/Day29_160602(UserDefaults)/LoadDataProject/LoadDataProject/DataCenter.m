//
//  DataCenter.m
//  LoadDataProject
//
//  Created by juhyun seo on 6/2/16.
//  Copyright © 2016 WingsCompany. All rights reserved.
//

#import "DataCenter.h"

@implementation DataCenter

+ (instancetype)shardInstance {
    static DataCenter *dataCenter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataCenter = [[self alloc] init];
    });
    return dataCenter;
}

- (NSArray *)friendList {
    NSArray *dicrectoryPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = [dicrectoryPath objectAtIndex:0];
    NSString *docuPath = [basePath stringByAppendingPathComponent:@"friendsList.plist"];
    // 파일 유무 확인
    // 읽어만 오는 거라서. 이미 없으면 밑에 friendlist가 nil이기 때문에 이렇게 검증할 필요까지 없다.
//    NSFileManager *fileManager =[NSFileManager defaultManager];
//    if (![fileManager fileExistsAtPath:docuPath]) {
//        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"friendList" ofType:@"plist"];
//        [fileManager copyItemAtPath:bundlePath toPath:docuPath error:nil];
//    }
    
    NSArray *friendList = [NSArray arrayWithContentsOfFile:docuPath];
    return friendList;
}

- (void)addFriendInfo:(NSString *)name phone:(NSString *)phone {
    
    NSArray *dicrectoryPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = [dicrectoryPath objectAtIndex:0];
    NSString *docuPath = [basePath stringByAppendingPathComponent:@"friendsList.plist"];
    NSFileManager *fileManager =[NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:docuPath]) {
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"friendsList" ofType:@"plist"];
        [fileManager copyItemAtPath:bundlePath toPath:docuPath error:nil];
    }
    
    NSMutableArray *friendList = [NSMutableArray arrayWithContentsOfFile:docuPath];
    NSDictionary *newFriend = @{@"name":name, @"phone":phone};
    [friendList addObject:newFriend];
    [friendList writeToFile:docuPath atomically:NO];
    
    [NSUserDefaults standardUserDefaults];
}
@end
