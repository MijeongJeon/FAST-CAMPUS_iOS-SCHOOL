//
//  Casher.m
//  VendingMachine
//
//  Created by Mijeong Jeon on 5/13/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "Casher.h"

@interface Casher()

@property (nonatomic) NSInteger inputMoney;

@end


@implementation Casher

-(instancetype)init
{
    self = [super init];
    if (self) {
        _inputMoney = 0;
    }
    return self;
}

// 동전 추가
- (void)addCoin500
{
    self.inputMoney += 500;
}

- (void)addCoin100
{
    self.inputMoney += 100;
}

- (BOOL)buyDrink:(DrinkObject *)drink
{
    // can buy
    if (self.inputMoney >= drink.cost) {
        self.inputMoney -= drink.cost;
        return YES;
    }else{ //can't buy
        return  NO;
    }
}

- (NSDictionary *)changeMoney
{
    // init change
    NSMutableDictionary *changeDic = [[NSMutableDictionary alloc] initWithDictionary:@{@"500":@0,@"100":@0}];
    // 500원 계산
    if (self.inputMoney >= 500) {
        NSInteger coin500 = self.inputMoney/500;

        [changeDic setValue:[NSNumber numberWithInteger:coin500] forKey:@"500"];
        self.inputMoney %= 500;
    }
    
    if (self.inputMoney >= 100) {
        NSInteger coin100 = self.inputMoney / 100;
        [changeDic setValue:[NSNumber numberWithInteger:coin100] forKey:@"100"];
        self.inputMoney %= 100;
    }
    self.inputMoney = 0;
    
    return changeDic;
}







@end
