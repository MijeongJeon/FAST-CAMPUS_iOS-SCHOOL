//
//  main.m
//  1.triangularNum
//
//  Created by Mijeong Jeon on 5/6/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <Foundation/Foundation.h>


// 1. 스왑함수 만들기

void swapFunction(int num1, int num2){
    int num3 =0;
    
    num3 = num1;
    num1 = num2;
    num2 = num3;
    
    printf("%d, %d\n", num1, num2);
}


// 2. 삼각수 구하기1

int triangularNum(int num){
    int sum = 0;
    for (int i = 1; i<=num; i++) {
        sum += i;
    }
    return sum;
}


// 3. 삼각수 만들기2

void triangularRangeNum(int num1, int num2){
    for (int i = 1; i<=num2; i++) {
        int num3 = 0;
        
        
        if (i/5!=0 && i%5==0) {
            num3 = i;
            int sum = triangularNum(num3);
            printf("삼각수2.결과값은 %d입니다.\n",sum);
        }
    }
}


// 4. 각 자리수 더하기

void addAllNum(int num){
    int i = 1;
    int lastNum = 0;
    int sum = 0;
    
    while (num/i > 0) {
        lastNum = num/i%10;
        sum = lastNum + sum;
        i = i*10;
    }
    
    printf("%d 각자리 숫자의 합은 %d입니다.\n", num, sum);
}


int main(int argc, const char * argv[]) {
    
    swapFunction(3, 5);
    printf("삼각수1.결과값은 %d입니다.\n",triangularNum(10));
    triangularRangeNum(1, 15);
    addAllNum(5790);
    
    return 0;
}
