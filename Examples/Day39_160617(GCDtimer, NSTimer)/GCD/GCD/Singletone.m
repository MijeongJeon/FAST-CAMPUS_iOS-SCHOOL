//
//  Singletone.m
//  GCD
//
//  Created by Mijeong Jeon on 6/17/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "Singletone.h"

@implementation Singletone

+ (instancetype)singleToneMethod {
    static Singletone *defaultValue = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        defaultValue = [[Singletone alloc] init];
    });
    
    return defaultValue;
}

@end
