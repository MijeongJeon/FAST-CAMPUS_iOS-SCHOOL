//
//  AdjList.m
//  AdjList
//
//  Created by Mijeong Jeon on 5/30/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "AdjList.h"

@interface AdjList ()

@property (nonatomic, readwrite)NSInteger vertex;
@property (strong)NSMutableArray *arr;

@end

@implementation AdjList


- (instancetype)initWithVertex:(NSInteger)vertex {
    self = [super init];
    if (self) {
        self.vertex = vertex;
        self.arr = [NSMutableArray arrayWithCapacity:vertex+1];
        for (NSInteger i = 0; i<=vertex+1; i++){
            [_arr addObject:[NSMutableArray array]];
        }
    }
    return self;
}

- (BOOL)addEdgeWithFrom:(NSInteger)from andTo:(NSInteger)to {
    if (0 >= from || _vertex < from) return NO;
    if (0 >= to || _vertex < to) return NO;
    
    [_arr[from] addObject:@(to)];

    return YES;
}

- (BOOL)addEdgeWithFrom:(NSInteger)from andTo:(NSInteger)to andBidirection:(BOOL)bidirection {
    if (bidirection) {
        return [self addEdgeWithFrom:from andTo:to] && [self addEdgeWithFrom:to andTo:from];
    } else {
        return [self addEdgeWithFrom:from andTo:to];
    }
}

- (void)printList {
    for (NSInteger i = 1; i <= _vertex; i++) {
        NSMutableString *s = [NSMutableString string];
        [s appendFormat:@"arr[%zd]: ", i];
        for (id to in _arr[i]) {
            [s appendFormat:@" %@", to];
        }
        NSLog(@"%@",s);
    }
}


- (void)sortList {
    for (NSInteger i = 1; i <= _vertex; i++) {
        [_arr[i] sortUsingSelector:@selector(compare:)]; // NSMutatbleArray
        // _arr[i] = [_arr[i] sortArrayUsingSelector:@selector(compare:)]; NSArray
        
        }
    }
-(id)objectAtIndexedSubscript:(NSInteger)idx {
    return _arr[idx];
}


@end
