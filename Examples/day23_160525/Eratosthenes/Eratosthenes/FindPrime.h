//
//  FindPrime.h
//  Eratosthenes
//
//  Created by Mijeong Jeon on 5/25/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FindPrime : NSObject

@property (nonatomic)NSMutableArray *primes;
@property (nonatomic)NSMutableArray *isUnRemoved;

- (void)printPrimes;

@end
