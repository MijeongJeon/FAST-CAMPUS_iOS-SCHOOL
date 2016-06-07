//
//  DataCenter.h
//  LoadDataProject
//
//  Created by juhyun seo on 6/2/16.
//  Copyright © 2016 WingsCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataCenter : NSObject
+ (instancetype)shardInstance;
- (NSArray *)friendList;
- (void)addFriendInfo:(NSString *)name phone:(NSString *)phone;
@end
