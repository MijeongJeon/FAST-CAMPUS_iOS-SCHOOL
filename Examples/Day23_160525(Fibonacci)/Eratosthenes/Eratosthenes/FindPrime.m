//
//  FindPrime.m
//  Eratosthenes
//
//  Created by Mijeong Jeon on 5/25/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "FindPrime.h"

@implementation FindPrime

- (NSMutableArray *)findPrimeNumbers {
    NSInteger number=100;
    
    _isUnRemoved = [[NSMutableArray alloc] initWithCapacity:number];
    for (NSInteger i =0; i < number; i++) {
        [_isUnRemoved addObject:@(YES)];
    }
    
    _primes = [[NSMutableArray alloc] initWithCapacity:number];
    for (NSInteger i=2; i<number; i++) {
        if ([_isUnRemoved[i] boolValue]==YES) {
            [_primes addObject:@(i)];
        }
        for (NSInteger j=i*i; j<number; j++) {
            if (j%i == 0) {
                _isUnRemoved[j]=@(NO);
            }
        }
    }
    return _primes;
}

- (void)printPrimes {
    for (NSString *prime in [self findPrimeNumbers]) {
        NSLog(@"%@",prime);
    }
}

@end
