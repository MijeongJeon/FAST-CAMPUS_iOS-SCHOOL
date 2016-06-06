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
- (void)addUserInfoWithID:(NSString *)ID andEmail:(NSString *)email andPassword:(NSString *)password;
- (void)removeFileContents;
+ (id)setUserDefaults;
@end
