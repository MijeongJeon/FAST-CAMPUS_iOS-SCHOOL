//
//  main.c
//  Stack(cursor)
//
//  Created by Mijeong Jeon on 5/23/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#include <stdio.h>
#include <string.h>
char left[500000];
char right[500000];

int left_size = 0;
int right_size = 0;

int main() {

    scanf("%s",left);
    left_size = (int)strlen(left);
    
    int t;
    scanf("%d",&t);
    
    for (int i=0; i<t; i++) {
        char cmd;
        scanf(" %c",&cmd);
        if (cmd == 'L') {
            if (left_size>0) {
                right[right_size] = left[left_size-1];
                right_size++;
//                left[left_size]=0;
                left_size--;
            }
        } else if (cmd == 'D') {
            if (right_size>0) {
                left[left_size] = right[right_size-1];
                left_size++;
//                right[right_size] = 0;
                right_size--;
            }
        } else if (cmd == 'B') {
            if (left_size>0) {
//                left[left_size] = 0;
                left_size--;
            }
        } else if (cmd == 'P') {
            char x;
            scanf(" %c",&x);
            left[left_size] = x;
            left_size++;

        }
    }
    for (int j=0; j<left_size; j++) {
        printf("%c",left[j]);
    }
    for (int k=right_size-1; k>=0; k--) {
        printf("%c",right[k]);
    }
    return 0;
}
