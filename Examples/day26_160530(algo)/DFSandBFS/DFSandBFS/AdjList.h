//
//  AdjList.h
//  AdjList
//
//  Created by Mijeong Jeon on 5/30/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AdjList : NSObject

- (instancetype)initWithVertex:(NSInteger)vertex;
- (BOOL)addEdgeWithFrom:(NSInteger)from andTo:(NSInteger)to ;
- (BOOL)addEdgeWithFrom:(NSInteger)from andTo:(NSInteger)to andBidirection:(BOOL)bidirection;
- (void)printList ;
- (void)sortList;

- (id)objectAtIndexedSubscript:(NSInteger)idx;

@end
