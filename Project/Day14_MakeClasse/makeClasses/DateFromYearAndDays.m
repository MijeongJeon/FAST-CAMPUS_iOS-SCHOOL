//
//  DateFromYearAndDays.m
//  makeClasses
//
//  Created by Mijeong Jeon on 5/12/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "DateFromYearAndDays.h"

@implementation DateFromYearAndDays

{
    NSInteger yearInput;
    NSInteger daysInput;
}

// 연도, 일수 받기
- (void)setYearAndDays:(NSInteger)year Days:(NSInteger)days
{
    yearInput = year;
    daysInput = days;
}

// 윤년확인
-  (BOOL)isLeapYear
{
    if ((yearInput % 4 == 0 && yearInput % 100 != 0)||yearInput % 400 ==0) {
        return YES;
    }
    return NO;
}

// 월별 마지막날 계산
- (NSInteger)findLastdayOfMonth:(NSInteger)month
{
    switch (month) {
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
            return 31;
            break;
        case 2:
            if ([self isLeapYear]) {
                return 29;
            }else{
                return 28;
            }
            break;
            
        default:
            return 30;
            break;
    }
}


// 월, 일 계산

- (void)findMonthAndDate
{
    NSInteger resultMonth = 1;
    NSInteger resultDate = daysInput;
    
    for (NSInteger i = 1;resultDate > [self findLastdayOfMonth:i]; i++)
    {
        while (resultDate > [self findLastdayOfMonth:i])
        {
            resultDate -= [self findLastdayOfMonth:i];
            
            if (resultDate == 0)
            {
                resultDate = [self findLastdayOfMonth:i];
            }
                i++;
        }
        resultMonth = i;
    }
    NSLog(@"%ld년에서 %ld일 지난날은 %ld월 %ld일 입니다.\n",yearInput,daysInput ,resultMonth, resultDate);
}

@end
