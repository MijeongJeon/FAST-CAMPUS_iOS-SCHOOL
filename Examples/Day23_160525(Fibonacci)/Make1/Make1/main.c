//
//  main.c
//  Make1
//
//  Created by Mijeong Jeon on 5/25/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    int n;
    scanf("%d",&n);

    int count[1000000];
    count[1] = 0;
    
    for (int i = 2; i <=n; i++) {
        count[i] = count[i-1] + 1;
        if (i%2 == 0 && count[i] > count[i/2]+1 ) {
            count[i] = count[i/2] +1;
        }
        if (i%3  == 0 && count[i] > count[i/3]+1 ) {
            count[i] = count[i/3] +1;
        }
    }
    printf("%d\n",count[n]);

    return 0;
}
