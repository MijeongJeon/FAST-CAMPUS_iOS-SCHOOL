//
//  CalculationScore.m
//  1. ExamScore
//
//  Created by Mijeong Jeon on 5/10/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "CalculationScore.h"

@implementation CalculationScore

// 과목 list
{
    NSMutableArray *subjectsList;
}

/* init override
- (instancetype)initWithSubjects:(NSArray *)newSubjects {
    self = [super init];
    if (self) { // == (self != nil)
        subjectsList = [[NSMutableArray alloc]initWithArray:newSubjects];
    }
    return self;
}
*/

 // custom init(headfile에 넣어야 main함수에서 사용할 수 있음)
// ex. CalculationScore *csClass = [[CalculationScore alloc]initWithArray:@[@3]];



/*
 // 과목 점수 추가_NSNumber 파라미터 타입 이용(변환과정 불필요, @필요, 숫자입력시 불편할 수 있음)
 - (void)addSubjectsScore:(NSNumber*)score {
 
 
 // 초기화
 if (subjectsList == nil) {
 subjectsList = [[NSMutableArray alloc] initWithCapacity:1];
 }
 
 
 // 어레이에 추가
 [subjectsList addObject:score];
 
 }
 */

// 과목 점수 추가_NSInteger 파라미터 타입 이용(변환 과정 필요)
- (void)addSubjectsScore:(NSInteger)score {
    // 초기화
    if (subjectsList == nil) {
        subjectsList = [[NSMutableArray alloc] initWithCapacity:1];
        // =  subjectsList = [[NSMutableArray alloc] init];
        
    }
    // NSNumber 참조형 타입으로 변환(numberWithInteger = NSNumber Class Method score의 변환 필요)
    NSNumber *scoreNum = [NSNumber numberWithInteger:score];
    
    // 어레이에 추가
    [subjectsList addObject:scoreNum];
}
 
// 등급반환 메소드
+ (NSString *)scoreToGrade:(NSInteger)score {

    NSString *grade = 0;
    
    if (100 >= score && 90 <= score) {
        grade = @"A+";
    } else if (90 > score && 80 <= score) {
        grade = @"A";
    } else if (80 > score && 70 <= score) {
        grade = @"B+";
    } else if (70 > score && 60 <= score) {
        grade = @"B";
    } else if (60 > score && 70 <= score) {
        grade = @"C+";
    } else {
        grade = @"low grade";
    }
    return grade;
}

// 포인트 변환 메소드
+ (CGFloat)gradeToPoint:(NSString *)grade {
    CGFloat point = 0;

    if ([grade  isEqual: @"A+"]) {
        point = 4.5 ;
    } else if ([grade  isEqual: @"A"]) {
        point = 4;
    } else if ([grade  isEqual: @"B+"]) {
        point = 3.5;
    } else if ([grade  isEqual: @"B"]) {
        point = 3;
    } else if ([grade  isEqual: @"C+"]) {
        point = 2.5;
    } else {
        point = 0;
    }
    return point;
}


// 과목 총점
- (NSInteger)totalScore {
    NSInteger totalScore = 0;
    for (NSNumber *score in subjectsList) {
        totalScore += score.integerValue;
    }
    return totalScore;
}

// 평균 구하기
- (CGFloat)averageScore {
    if (subjectsList.count > 0){ // 과목이 1개 이상일 때
        CGFloat averageScore = ((CGFloat)[self totalScore])/subjectsList.count;
        return averageScore;
    } else { // 과목에 점수가 없을때
        return 0;
    }
}

@end
