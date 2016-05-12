//
//  CalculationScore.h
//  1. ExamScore
//
//  Created by Mijeong Jeon on 5/10/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculationScore : NSObject // 클래스 선언

- (void)addSubjectsScore:(NSInteger)score; // 점수 입력 메소드 선언
- (CGFloat)averageScore; // 평균 구하기 메소드 선언
+ (NSString*)scoreToGrade:(NSInteger)score; // 등급 구하기 메소드 선언
+ (CGFloat)gradeToPoint:(NSString*)grade; // 포인트 점수 구하기 메소드 선언

@end
