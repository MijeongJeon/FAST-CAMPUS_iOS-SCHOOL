//
//  main.c
//  Fibonacci
//
//  Created by Mijeong Jeon on 5/25/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {

    int fibo[100];
     fibo[0] = 0;
     fibo[1] = 1;
    int n;
    
    scanf("%d",&n);
    
    for (int i = 2; i<=n; i++) {
        
        fibo[i] = fibo[i-1] + fibo[i-2];
    }
    printf("%d\n",fibo[n]);
    
    return 0;
}
