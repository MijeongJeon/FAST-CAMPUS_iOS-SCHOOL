//
//  DataCenter.m
//  UserDefaults
//
//  Created by Mijeong Jeon on 6/2/16.
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


- (void)printData {
    NSLog(@"name is %@, age is %ld\n",_name, _age);
}
@end
