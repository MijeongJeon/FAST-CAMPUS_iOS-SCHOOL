//
//  main.m
//  Eratosthenes
//
//  Created by Mijeong Jeon on 5/25/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FindPrime.h"

int main(int argc, const char * argv[]) {

    FindPrime *prime = [[FindPrime alloc] init];
    
    [prime printPrimes];

    return 0;
}
