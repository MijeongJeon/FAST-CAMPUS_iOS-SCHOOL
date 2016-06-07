//
//  main.m
//  makeClasses
//
//  Created by Mijeong Jeon on 5/12/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "LastNumberRoundOff.h"
#import "DateFromYearAndDays.h"
#import "ReverseNumber.h"

int main(int argc, const char * argv[]) {
    
    
    // 1. LastNumRoundOff(마지막 자리 반올림)
    
    CGFloat inputNum = 2.12345;
    LastNumberRoundOff *lastNumRound = [[LastNumberRoundOff alloc]init];
    
    NSLog(@"%lf => %lf\n",inputNum,[lastNumRound numberInput:inputNum decicalPoint:5]);
    
    
    // 2. DateFromYearAndDays(날짜로 월, 일 계산)
    
    NSInteger inputYear = 2016;
    NSInteger inputDays = 102;
    
    DateFromYearAndDays  *findDate = [[DateFromYearAndDays alloc]init];
    
    [findDate setYearAndDays:inputYear Days:inputDays];
    [findDate findMonthAndDate];
    
    
    // 3. RiverseNumber(숫자 뒤집기)
    
    NSInteger numToReverse = 12345;
    ReverseNumber *resultNumber = [[ReverseNumber alloc]init];
    
    NSLog(@"%ld ==> %ld\n",numToReverse, [resultNumber reversNumber:numToReverse]);
    
    
return 0;

}
