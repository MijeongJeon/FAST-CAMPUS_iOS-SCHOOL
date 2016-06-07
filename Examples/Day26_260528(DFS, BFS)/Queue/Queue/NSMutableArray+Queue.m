//
//  NSMutableArray+Queue.m
//  DFS and BFS
//
//  Created by Mijeong Jeon on 5/30/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "NSMutableArray+Queue.h"

@implementation NSMutableArray (Queue)

- (void)push:(id)object {
    [self addObject:object];
}

- (id)pop {
    if (self.count == 0) {
        return nil;
    } else {
        id head = self[0];
        [self removeObject:self[0]];
        return head;
    }
    
}

- (BOOL)empty {
    if (self.count == 0) {
        return YES;
    } else {
        return NO;
    }
    
}


@end
