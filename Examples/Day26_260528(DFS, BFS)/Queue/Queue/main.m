//
//  main.m
//  DFS and BFS
//
//  Created by Mijeong Jeon on 5/30/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSMutableArray+Queue.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableArray *queue =[[NSMutableArray alloc] initWithCapacity:1];
        for (NSInteger i =1; i<=10; i++) {
            [queue push:@(i)];
        }
        while (![queue empty]) {
            NSLog(@"%@", [queue pop]);
        }
    
    
    }
    return 0;
}
