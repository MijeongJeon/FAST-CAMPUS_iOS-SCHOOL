
//
//  main.m
//  2. checkDDay
//
//  Created by Mijeong Jeon on 5/6/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <Foundation/Foundation.h>

//************* 기원전 계산법 ***********//


int anniversaryDate = 0;
int yearCountPre = 0;
const int todayDate = 20160509;

\
// 기념일 받는 함수
int setAnniversaryDate(int day) {
    anniversaryDate = day;
    //printf("%d일",anniversaryDate);
    return anniversaryDate;
}


// 일 분리 함수
int seperateDayCount(int day) {
    //printf("%d일",setAnniverDate(anniverDate)%100);
    
    return day%100;
    
}

// 윤년 계산
bool isLeapYear(int day) {
    if ((yearCountPre % 4 == 0 && yearCountPre % 100 != 0) || yearCountPre % 400 == 0) {
        return true;
    }
    return false;
}

// 연 분리 함수 및 윤년 계산
int seperateYearCount(int day) {
    int yearCount = 0;
    int yearCountDay=0;
    yearCountPre = day/10000;
    
    for(int i=0; i<= yearCountPre; i++) {
        
        if (isLeapYear(yearCountPre)) {
            yearCountDay=  366;
        } else {
            yearCountDay=  365;
        }
        yearCount += yearCountDay;
    }
    return yearCount;
    
}

// 월 분리 함수 및 날짜 수 계산

int seperateMonthCount(day) {
    int monthCountPre = day/100%100;
    int monthCountDay = 0;
    int monthCount  = 0 ;
    
    for(int i=0; i< monthCountPre; i++) {
        
        switch (i) {
            case 1:
            case 3:
            case 5:
            case 7:
            case 8:
            case 10:
            case 12:
                monthCountDay = 31;
                break;
            case 2:
                if (isLeapYear(yearCountPre)) {
                    
                    monthCountDay=29;
                } else {
                    monthCountDay=28;
                }
                break;
            default:
                monthCountDay = 30;
                break;
        }
        
        monthCount += monthCountDay;
        
    }
    return monthCount;
}


// day 더하기
int addDay(int day) {
    return seperateDayCount(day) + seperateYearCount(day) + seperateMonthCount(day);
}


// 함수 실행
int main(int argc, const char * argv[]) {
    
    setAnniversaryDate(20160121);
    
    printf("%d일은 오늘로 부터 %d일 지났습니다.\n",anniversaryDate,addDay(todayDate)-addDay(anniversaryDate));
    
    
    return 0;
}
