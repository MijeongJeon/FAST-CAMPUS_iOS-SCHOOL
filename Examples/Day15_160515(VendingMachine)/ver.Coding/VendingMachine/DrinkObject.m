//
//  DrinkObject.m
//  VendingMachine
//
//  Created by Mijeong Jeon on 5/13/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "DrinkObject.h"

@implementation DrinkObject

- (instancetype)initWithName:(NSString *)name cost:(NSInteger)cost;
{
    self = [super init];
    if (self) {
        _name = name;
        _cost = cost;
    }
    return self;
}

@end
