//
//  main.c
//  Stack
//
//  Created by Mijeong Jeon on 5/23/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#include <stdio.h>
#include <string.h>

int main(int argc, const char * argv[]) {
    
    int t;
    scanf("%d",&t);
    
    for (int i = 0; i < t; i++) {
        char str[50];
        scanf("%s",str);
        int n = (int)strlen(str);
        int cnt = 0;
        int negative = 0;
        for (int j = 0; j < n; j++) {
            char c = str[j];
            if (c=='(') {
                cnt ++;
            } else {
                cnt --;
            }
            if (cnt < 0) {
                negative = 1;
            }
        }
        if (negative != 1 && cnt == 0) {
            printf("YES\n");
        } else {
            printf("NO\n");
        }
    }
    return 0;
}
