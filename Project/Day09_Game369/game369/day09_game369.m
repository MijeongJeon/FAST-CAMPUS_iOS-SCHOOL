//
//  main.m
//  5. 369 Game
//
//  Created by Mijeong Jeon on 5/5/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <Foundation/Foundation.h>

void game369(){
    
    int a = 1;
    int b = 0;
    
    for (int j=1; j<10000; j++) {
        int i=1;
        
        while (i<100) {
            
            a = j/i%10;
            
            if (a%3 == 0 && a != 0) {
                b=1;
                break;
                
            } else {
                i=i*10;
                b=0;
            }
        }
        if (b==1) {
            printf("*\n");
        } else {
            printf("%d\n",j);
        }
    }
}

int main(int argc, const char * argv[]) {
    
    game369();
    
    return 0;
}