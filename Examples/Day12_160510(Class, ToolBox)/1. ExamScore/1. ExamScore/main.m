//
//  main.m
//  1. ExamScore
//
//  Created by Mijeong Jeon on 5/10/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CalculationScore.h"

int main(int argc, const char * argv[]) {
    
    // CalculationScore Class의 객체화 -> 객체의 Method 실행
    
    // 객체화
     CalculationScore *csClass = [CalculationScore alloc];
     csClass=[csClass init]; 
    
    // 객체 메소드 실행
    
    // 점수 평균 출력
     [csClass addSubjectsScore:100];
     [csClass addSubjectsScore:80];
     [csClass addSubjectsScore:75];
     
     CGFloat average = [csClass averageScore];
     NSLog(@"average = %f",average);
    
    /*
    //  인스턴스 메소드!!
    // 등급 출력
    NSLog(@"%@ 등급입니다.\n",[csClass scoreToGrade:72]);
    // 포인트 점수 출력
    NSLog(@"%0.1lf점 입니다.\n", [csClass gradeToPoint:[csClass scoreToGrade:72]]);
    */
    
    /*
    // 클래스 메소드!!
    // 등급 출력 메소드
    NSLog(@"%@ 등급입니다.\n",[CalculationScore scoreToGrade:90]);
    // 포인트 출력 메소드
    NSLog(@"%0.1lf점 입니다.\n", [CalculationScore gradeToPoint:[CalculationScore scoreToGrade:90]]);
    */
    
    return 0;
}
