//
//  Casher.h
//  VendingMachine
//
//  Created by Mijeong Jeon on 5/13/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DrinkObject.h"

@interface Casher : NSObject

// 동전 추가 메소드
- (void)addCoin500;
- (void)addCoin100;
- (NSInteger) inputMoney;

//@property (nonatomic, readonly) NSInteger inputMony;

// 음료수 사는 메소드
- (BOOL)buyDrink:(DrinkObject *)drink;

// 돈 거슬러줄 동전 list
//{@"500":count, @"100":count}
- (NSDictionary *)changeMoney;

@end
