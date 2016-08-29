//
//  main.m
//  2. googooDan
//
//  Created by Mijeong Jeon on 5/9/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <Foundation/Foundation.h>

//***************** 구구단 구하기 **************//

void gooGooDan(NSArray *danSoo) {
    for (NSNumber *dan in danSoo) {
        for (int i=1; i<10; i++) {
            NSLog(@"%@ * %d = %ld\n",dan,i,i*dan.integerValue);
        }
        NSLog(@"===========\n");
    }
}

int main(int argc, const char * argv[]) {
    
    NSArray *danSoo = @[@1, @13, @49998];
    gooGooDan(danSoo);
    
    return 0;
}
