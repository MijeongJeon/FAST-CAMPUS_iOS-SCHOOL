//
//  main.c
//  Queue
//
//  Created by Mijeong Jeon on 5/23/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#include <stdio.h>
#include <string.h>

int queue[10000];
int begin = 0;
int end = 0;

int main(int argc, const char * argv[]) {
    
    int n;
    scanf("%d",&n);
    
    for (int i = 0; i < n; i ++) {
        char cmd[100];
        scanf("%s",cmd);
        
        if (!strcmp(cmd,"pop")) {
            if (end == begin) {
                printf("-1\n");
            } else {
                printf("%d\n",queue[begin]);
                begin ++;
            }
        } else if (!strcmp(cmd,"empty")) {
            if (end == begin) {
                printf("1\n");
            } else {
                printf("0\n");
            }
        } else if (!strcmp(cmd,"front")) {
            if (end == begin) {
                printf("-1\n");
            } else {
                printf("%d\n",queue[begin]);
            }
        } else if (!strcmp(cmd,"back")) {
            if (end == begin) {
                printf("-1\n");
            } else {
                printf("%d\n",queue[end-1]);
            }
        } else if (!strcmp(cmd,"size")) {
            printf("%d\n",end-begin);
        } else {
            int x;
            scanf(" %d",&x);
            queue[end]=x;
            end++;
        }
    }
    
    return 0;
}
