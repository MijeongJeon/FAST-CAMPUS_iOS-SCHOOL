//
//  main.m
//  2. matchingGrade
//
//  Created by Mijeong Jeon on 5/5/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <Foundation/Foundation.h>

int grade = 0;

// 등급 구하는 함수
void matchingGrade(float score) {
    if (score <=100 && score >= 90) {
        grade = 1;
        printf("%0.1f점은 %d등급입니다.\n", score, grade);
    } else if (score < 90 && score >= 80) {
        grade = 2;
        printf("%0.1f점은 %d등급입니다.\n", score, grade);
    } else if (score < 80 && score >= 70) {
        grade = 3;
        printf("%0.1f점은 %d등급입니다.\n", score,grade);
    } else if (score < 70 && score >= 60) {
        grade = 4;
        printf("%0.1f점은 %d등급입니다.\n", score,grade);
    } else {
        printf("공부 좀 열심히하세요\n");
    }
}
// 장학금 주는 함수
void shcolarshipWthGrade() {
    switch (grade) {
        case 1:
            printf("전액장학금을 지원하겠습니다.\n");
            break;
        case 2:
            printf("50%% 장학금을 지원하겠습니다.\n");
            break;
        case 3:
            printf("25%% 장학금을 지원하겠습니다.\n");
            break;
        default:
            printf("장학금 없습니다.\n");
            break;
    }
}

int main(int argc, const char * argv[]) {
   
    matchingGrade(70.7);
    shcolarshipWthGrade();
    
    return 0;
}
