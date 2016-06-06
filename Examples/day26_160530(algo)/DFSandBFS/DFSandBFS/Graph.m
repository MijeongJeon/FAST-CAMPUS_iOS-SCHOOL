//
//  Graph.m
//  DFSandBFS
//
//  Created by Mijeong Jeon on 5/30/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "Graph.h"
#import "AdjList.h"
#import "NSMutableArray+Queue.h"

@interface Graph ()

@property (strong)AdjList *adj;
@property (readwrite)NSInteger vertex;

- (void)dfsAndCurrentNow:(NSInteger)now andVisited:(NSMutableArray *)check;

@end

@implementation Graph

-(instancetype)initWithVertex:(NSInteger)vertex {
    [super self];
    if (self) {
        _vertex = vertex;
        _adj = [[AdjList alloc] initWithVertex:vertex];
    }
    return self;
}

-(void)loadDemoData {
    [_adj addEdgeWithFrom:1 andTo:2 andBidirection:YES];
    [_adj addEdgeWithFrom:1 andTo:5 andBidirection:YES];
    [_adj addEdgeWithFrom:2 andTo:3 andBidirection:YES];
    [_adj addEdgeWithFrom:2 andTo:4 andBidirection:YES];
    [_adj addEdgeWithFrom:2 andTo:5 andBidirection:YES];
    [_adj addEdgeWithFrom:3 andTo:4 andBidirection:YES];
    [_adj addEdgeWithFrom:4 andTo:5 andBidirection:YES];
    [_adj addEdgeWithFrom:4 andTo:6 andBidirection:YES];
    [_adj sortList];
    [_adj printList];
}

-(void)dfsWithStrat:(NSInteger)start {
    NSMutableArray *check = [NSMutableArray array];
    for (NSInteger i=0; i <= _vertex; i++) {
        [check addObject:@(NO)];
    }
    [self dfsAndCurrentNow:start andVisited:check];
}

-(void)dfsAndCurrentNow:(NSInteger)now andVisited:(NSMutableArray *)check {
    NSLog(@"DFS 시작");

    if ([check[now] boolValue] == YES) {
        return;
    }
    check[now] = @(YES);
    NSLog(@"%zd 방문", now);
    // adj[node]; -> [adj objectAtInedxSubscript:node]
    for (id next in _adj[now]) {
        [self dfsAndCurrentNow:[next integerValue] andVisited:check];
    }
}

-(void)bfsWithStart:(NSInteger)start {
    NSLog(@"BFS 시작");
    NSMutableArray *check = [NSMutableArray array];
    for (NSInteger i=0; i<=self.vertex; i++) {
        [check addObject:@(NO)];
    }
    
    NSMutableArray *queue = [NSMutableArray array];
    [queue push:@(start)];
    check[start] = @(YES);
    
    while (![queue empty]) {
        NSInteger now = [[queue pop] integerValue];
        NSLog(@"%zd 방문", now);
        
        // 다음에 방문할 정점을 찾는다
        for (id nextObj in self.adj[now]) {
            NSInteger next = [nextObj integerValue];
            // 여기서 검사해야할 것은 무엇인가!
            if ([check[next] boolValue] == NO) {
                // next를 방문한다 -> next를 큐에 넣는다
                [queue push:@(next)];
                check[next] = @(YES);
            }
        }
    }
}

@end
