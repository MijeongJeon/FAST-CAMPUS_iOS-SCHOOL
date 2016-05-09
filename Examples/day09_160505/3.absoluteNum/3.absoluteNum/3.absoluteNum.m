//
//  main.m
//  3.absoluteNum
//
//  Created by Mijeong Jeon on 5/5/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <Foundation/Foundation.h>

int result = 0;

// 절대값 구하기
int absoluteNum(int number){
    if (number >= 0) {
        result = number;
    }else{
        result = - number;
    }
    return result;
}

// 대문자 소문자 숫자 구별
void checkAlphabet(char Alphabet){
    if (Alphabet>='0' && Alphabet<='9' ) {
        printf("%c는 숫자입니다.\n",Alphabet);
    }else if (Alphabet>='A' && Alphabet<='Z' ){
        printf("%c는 대문자입니다.\n",Alphabet);
    }else if (Alphabet>='a' && Alphabet<='z' ){
        printf("%c는 소문자입니다.\n",Alphabet);
}
}

// 윤년 구별
void checkLeapYear(int year){
    if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
        printf("%d는 윤년입니다.\n",year);
    } else {
        printf("%d는 윤년이 아닙니다.\n", year);
    }
}

int main(int argc, const char * argv[]) {

    printf("%d\n",absoluteNum(-123));
    checkAlphabet('M');
    checkAlphabet('j');
    checkAlphabet('8');
    checkLeapYear(2016);//윤
    checkLeapYear(2000);//윤
    checkLeapYear(2100);//안
    
    return 0;
}
