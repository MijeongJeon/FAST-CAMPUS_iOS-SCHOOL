//
//  DataCenter.h
//  LoginPage
//
//  Created by Mijeong Jeon on 6/3/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataCenter : NSObject

+ (instancetype)sharedInstance;
- (NSString *)findUserInfoPath;
- (BOOL)isCheckLoginwithID:(NSString *)userID userPW:(NSString *)userPW;
- (BOOL)isCheckLoginwithID:(NSString *)userID;
- (void)addUserInfoWithID:(NSString *)ID andPassword:(NSString *)password;
- (void)removeFileContents;
+ (id)userDefaults;
@end
