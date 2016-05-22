//
//  MyClass.m
//  day19_example02
//
//  Created by Mijeong Jeon on 5/19/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "MyClass.h"

@implementation MyClass


- (NSInteger)age {
    NSLog(@"someone wants my age.\n");
    return _age;
}

- (void)setAge:(NSInteger)age {
    _age = age;
}

//- (NSInteger)name {
//    return _name;
//}

//
//- (void)setName:(NSString *)name {
//    name = _name;
//}

@end
