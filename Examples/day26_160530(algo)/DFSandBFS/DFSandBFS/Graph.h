//
//  Graph.h
//  DFSandBFS
//
//  Created by Mijeong Jeon on 5/30/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Graph : NSObject

- (instancetype)initWithVertex:(NSInteger)vertex;
- (void)loadDemoData;
- (void)dfsWithStrat:(NSInteger)start;
- (void)bfsWithStart:(NSInteger)start;

@end
