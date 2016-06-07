//
//  main.m
//  4. for
//
//  Created by Mijeong Jeon on 5/5/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <Foundation/Foundation.h>

int result = 1;

// 구구단 함수
void googoodan(int dan) {
    for (int i=1; i<10; i++) {
        printf("%d * %d = %d\n", dan, i, dan*i);
    }
}


// Factorial
void factorial(int num) {
    for (int i=1; i < num+1 ; i++) {
        result = result * i;
    }
    printf("factorial(%d) = %d\n", num, result);

}

 

int main(int argc, const char * argv[]) {
   
    googoodan(9);
    factorial(3);
    
    return 0;
}
