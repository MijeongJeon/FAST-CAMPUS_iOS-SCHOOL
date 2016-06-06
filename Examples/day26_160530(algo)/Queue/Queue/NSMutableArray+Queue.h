//
//  NSMutableArray+Queue.h
//  DFS and BFS
//
//  Created by Mijeong Jeon on 5/30/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Queue)

- (void)push:(id)object;
- (id)pop;
- (BOOL)empty;

@end
