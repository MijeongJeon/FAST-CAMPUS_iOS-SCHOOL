//
//  main.m
//  dDayCheck2
//
//  Created by Mijeong Jeon on 5/9/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <Foundation/Foundation.h>

//************* 강사님 계산법(기준일자 : before date) ***********//

int eventDate = 0;
int todayDate = 20160509;

// 함수 선언
bool isLeapYear(int year);
int lastDayOfMonth(int month, int year);
int totalDayWithDate(int date);

// 이벤트 날짜 받기
void setEventDate(int date){
    eventDate = date;
}

// 월 날짜 계산
int getLastDayOfMonth(int month, int year){
    
    int lastDayOfMonth = 0;
    int countDayOfMonth = 0;
    
    for (int i = 1; i < month; i++) {
        
        switch (i) {
            case 1:
            case 3:
            case 5:
            case 7:
            case 8:
            case 10:
            case 12:
                lastDayOfMonth = 31;
                break;
            case 2:
                if (isLeapYear(year)) {
                    lastDayOfMonth =29;
                }
                lastDayOfMonth=28;
                break;
            default:
                lastDayOfMonth = 30;
                break;
        }
        
        countDayOfMonth += lastDayOfMonth;
    }
    return countDayOfMonth;
}

// 날짜 선후 고려 및 날짜 계산
int calculationDday(){
    int afterDate = 0;
    int beforeDate = 0;
    int diffYearDay = 0;
    int daysUntilAfter = 0;
    int daysUntilBefore = 0;
    
    if (todayDate >= eventDate) {
        afterDate = todayDate;
        beforeDate = eventDate;
    } else {
        afterDate = eventDate;
        beforeDate = todayDate;
    }
    
    diffYearDay = (afterDate/10000 - beforeDate/10000) * 365;
    
    for (int i = beforeDate; i < afterDate/10000; i++) {
        if (isLeapYear(i)) {
            diffYearDay ++;
        } // 년 차이 날짜
    }
    
    daysUntilAfter = getLastDayOfMonth(afterDate/100%100, afterDate) + afterDate%100;
    daysUntilBefore = getLastDayOfMonth(beforeDate/100%100, afterDate) + beforeDate%100;
    
    return diffYearDay + daysUntilAfter - daysUntilBefore +1 ; // 총 날짜 차이 계산
}

// 윤년 검사 함수
bool isLeapYear(int day) {
    
    int year = day/10000;
    
    if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
        return true;
    } else {
        return false;
    }
}

// 프린팅 함수
void printDDay() {
    if (todayDate>=eventDate) {
        printf("D+%d\n",calculationDday()); // 날짜가 지났을 때
    } else {
        printf("D-%d\n",calculationDday()); // 날짜가 남았을 때
    }
}

// 함수 실행
int main(int argc, const char * argv[]) {
    
    setEventDate(20190202);
    printDDay();
    
    setEventDate(20130813);
    printDDay();
    
}
