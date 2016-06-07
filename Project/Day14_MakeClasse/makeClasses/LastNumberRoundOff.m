//
//  LastNumberRoundOff.m
//  makeClasses
//
//  Created by Mijeong Jeon on 5/12/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "LastNumberRoundOff.h"

@implementation LastNumberRoundOff

// 밑, 지수 => x^n 값 구하기 
- (CGFloat)forExponential:(CGFloat)number1 exponetial:(NSInteger)number2
{
    for (NSInteger i = 1; i <= number2 ; i++) {
        number1 = number1 * 10;
    }
    return number1;
}


// 마지막 자리수에서 반올림하기
- (CGFloat)numberInput:(CGFloat)number1 decicalPoint:(NSInteger)number2
{
    return (CGFloat)((NSInteger)(number1 * [self forExponential:10 exponetial:number2-1] + 5)/10)/[self forExponential:0.1 exponetial:number2];
}


@end
