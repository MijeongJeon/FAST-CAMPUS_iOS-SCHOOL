//
//  main.m
//  day11_160509
//
//  Created by Mijeong Jeon on 5/9/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <Foundation/Foundation.h>

//******************** 평균 구하기 *************************//
// 총점
NSInteger totalSubjects(NSArray *subjects){
    NSInteger totalScore = 0;

    for (NSNumber *score in subjects) {
        totalScore += score.integerValue;
    }
    return totalScore;
}

// 평균

CGFloat averageSubjects(NSArray *subjects){
    CGFloat total = (CGFloat)totalSubjects(subjects);
    return total/subjects.count;
}


int main(int argc, const char * argv[]) {
        NSArray *subjesctlList = @[@100, @99, @34, @78, @52, @82, @100];
        CGFloat average = averageSubjects(subjesctlList);
        NSLog(@"%0.2f",average);
    

    
    return 0;
    }
