//
//  main.c
//  Algo_test
//
//  Created by Mijeong Jeon on 5/18/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//
#include <stdio.h>

int main(int argc, const char * argv[]) {
    

    int n;
    
    scanf("%d", &n);
    
    for (int i = 1; i <= n; i++) {
        for (int j=i; j<=n-1; j++) {
            printf(" ");
        }
            printf("*");
        if (i!=1) {
            for (int k = 1; k < i; k++) {
                printf(" ");
                printf("*");
            }

        }
                printf("\n");
        
    }
    return 0;
}