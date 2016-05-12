//
//  ReverseNumber.m
//  makeClasses
//
//  Created by Mijeong Jeon on 5/12/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "ReverseNumber.h"

@implementation ReverseNumber

// 자리수세기
- (NSInteger)countNumber:(NSInteger)number
{
    NSInteger digitNumber = 0;
    while (number != 0) {
        number = number/10;
        digitNumber ++;
    }
    return digitNumber;
}

// 자리수 거꾸로 바꾸기
- (NSInteger)reversNumber:(NSInteger)number1{
    NSInteger number2 = 0;
    NSInteger reverseReuslt = 0;
    
    while (number1 != 0){
        number2 = number1%10 * [super forExponential:0.1 exponetial:[self countNumber:number1]];
        number1 = number1/10;
        reverseReuslt += number2;
    }
    return reverseReuslt;
}

@end
