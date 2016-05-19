//
//  main.m
//  Example_day19
//
//  Created by Mijeong Jeon on 5/19/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <Foundation/Foundation.h>

// 상수연습
const NSUInteger maxValue = 30;
const NSUInteger minValue = 10;

// 열거연습1
typedef NS_ENUM(NSInteger, StudentCount) {
    StudentCountMax = 25,
    StudentCountMin = 10
};

BOOL canOpenClass(int numberOfStudent) {
    if (numberOfStudent > StudentCountMax) {
        printf("Too many students. Can't open\n");
        return false;
    } else if (numberOfStudent < StudentCountMin) {
        printf("Too less students. Can't open\n");
        return false;
    }
    printf("Good. Open the class\n");
    return true;
}


// 열거연습2
typedef NS_ENUM(NSInteger, Fruits) {
    FruitsApple = 100,
    FruitsPear,
    FruitsPeach,
    FruitsBanana,
    FruitsOrange
};

void chooseFruits(Fruits selectedFruit) {
    switch (selectedFruit) {
        case FruitsApple:
            printf("You selected apple.\n");
            break;
        case FruitsPear:
            printf("You selected pear.\n");
            break;
        case FruitsPeach:
            printf("You selected peach.\n");
            break;
        case FruitsBanana:
            printf("You selected bananan.\n");
            break;
        case FruitsOrange:
            printf("You selected orange.\n");
            break;
        default:
            printf("Wrong!!\n");
    }
}

// 옵션 연습
typedef NS_OPTIONS(NSInteger, FruitsOption) {
    FruitsOptionApple = 1 << 0,
    FruitsOptionPear  = 1 << 1,
    FruitsOptionPeach = 1 << 2,
    FruitsOptionBanan = 1 << 3,
    FruitsOptionOrange = 1 << 4
};

void selectFruitsOptions(FruitsOption options){
    if (options & FruitsOptionApple) {
        printf("apple ");
    }
    if ((options & FruitsOptionPear) != false) {
        printf("pear ");
    }
    if (options & FruitsOptionPeach) {
        printf("peach ");
    }
    if (options & FruitsOptionBanan) {
        printf("banana ");
    }
    if (options & FruitsOptionOrange) {
        printf("orange ");
    }
    printf("가 선택되었습니다.\n") ;
}


int main(int argc, const char * argv[]) {
    
    const NSString *myNM = @"MJ";
    static NSString *youNM   = @"J";
    
    NSLog(@"%@",myNM);
    NSLog(@"%@",youNM);
    
    myNM = @"K";
    youNM = @"H";
    
    NSLog(@"%@",myNM);
    NSLog(@"%@",youNM);
    
    canOpenClass(100);
    canOpenClass(20);
    canOpenClass(5);
    
    chooseFruits(FruitsOrange);
    chooseFruits(FruitsApple);
    
    chooseFruits(1231);
    
    chooseFruits(104);
    
    selectFruitsOptions(FruitsOptionOrange | FruitsOptionPeach | FruitsOptionApple);
    selectFruitsOptions(FruitsOptionPear);
    selectFruitsOptions(102); // 숫자에 비트 연산 처리해서 겹치는 부분 출력

    return 0;
}

