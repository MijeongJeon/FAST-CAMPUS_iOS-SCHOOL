//
//  main.c
//  Stack
//
//  Created by Mijeong Jeon on 5/22/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#include <stdio.h>
#include <string.h>

int data[1000000];
int size = 0;

void push(int num){
    
    data[size] = num;
    size ++;
}

int empty() {
    if (size == 0) {
        return 1;
    }else{
        return 0;
    }
}

int pop() {
    if (empty()) {
        return -1;
    } else {
        size -= 1;
        return data[size];
    }
}

int top() {
    if (empty()) {
        return -1;
    } else {
        return data[size-1];
    }
}

int getSize() {
    return size;
}


int main(int argc, const char * argv[]) {
    
    int n;
    scanf("%d",&n);
    
    for (int k=0; k<n; k++) {
        char cmd[100];
        scanf("%s",cmd);
        
        if (!strcmp(cmd,"push")) {
            int num;
            scanf("%d\n",&num);
            push(num);
        } else if (!strcmp(cmd,"top")) {
            // top
            printf("%d\n", top());
        } else if (!strcmp(cmd,"size")) {
            // size
            printf("%d\n", getSize());
        } else if (!strcmp(cmd,"empty")) {
            // empty
            printf("%d\n", empty());
        } else if (!strcmp(cmd,"pop")) {
            // pop
            printf("%d\n", pop());
            
        }
        
    }
    
    return 0;
}
