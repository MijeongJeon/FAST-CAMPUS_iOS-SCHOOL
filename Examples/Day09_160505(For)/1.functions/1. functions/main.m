//
//  main.m
//  1. functions
//
//  Created by Mijeong Jeon on 5/5/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <Foundation/Foundation.h>

float squareMeter = 0;
const float PI = 3.14;
float r = 0;
int korMoney = 0;
const int currency = 1300;
float number = 0;

// 값 입력

void setSquareMeter(float new) {
    squareMeter = new;
}

void setR(float new) {
    r = new;
}

void setKorMoney(int new) {
    korMoney = new;
}

void setNumber(float new) {
    number = new;
}


// 함수

// 1. 평수 구하기

float changeSpace() {
    return squareMeter * 0.3025;
}

// 2. 원의 둘레 구하기
float lengthCircle() {
    return r * 2 * PI;
}

// 3.환율 변환기
int changeMoney() {
    return korMoney / currency;
}

// 4. 소수점 3째 자리에서 반올림
float roundUp(float number) {
    return (float)((int)((number + 0.005) * 100))/100;
    
}



int main(int argc, const char * argv[]) {
    
    setSquareMeter(20);
    setR(3);
    setKorMoney(3000);
    setNumber(5.1245671);
    
    printf("%0.2f제곱미터는 %0.2f 평입니다.\n", squareMeter,changeSpace());
    printf("%0.2f반지름의 둘레는 %0.2fcm입니다.\n", r, lengthCircle());
    printf("%d원은 %d$입니다.\n", korMoney, changeMoney());
    printf("%f를 소수점 3번째 자리에서 반올림한 결과는 %f 입니다.\n", number, roundUp(number));
    
    return 0;
}
