//
//  main.m
//  AdjList
//
//  Created by Mijeong Jeon on 5/30/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AdjList.h"
#import "NSMutableArray+Queue.h"
#import "Graph.h"



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSInteger vertex = 6;
        Graph *graph = [[Graph alloc] initWithVertex:vertex];
        [graph loadDemoData];
        [graph dfsWithStrat:1];
        [graph bfsWithStart:1];
   
    }
    
    return 0;
}
