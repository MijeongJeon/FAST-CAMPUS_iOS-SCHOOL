//
//  MyTestClass.m
//  Example01
//
//  Created by Mijeong Jeon on 5/17/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "MyTestClass.h"

@implementation MyTestClass

// alloc override
+ (instancetype)alloc {
    NSLog(@"My Test Class alloc");
    
    [self testClassMethod];
//    [self testInstanceMethod]; // 호출불가
//    [MyTestClass testInstanceMethod]; // 호출불가
    
    return [super alloc];
}

// dealloc override (자동 메모리 관리ARC_dealloc 호출 불가)
- (void)dealloc {
    NSLog(@"My Test Class dealloc");
    
    [self testInstanceMethod];
//    [self testClassMethod]; // 호출불가
    [MyTestClass testClassMethod];
    [[self class] testClassMethod];
    
    // 객체가 메모리에서 해제되는 시점을 파악하고자 할때
    // 사용하고 있던 메모리 공간을 해제해야 할때
    
//     [super dealloc];
}

- (void)testInstanceMethod {
    NSLog(@"testInstanceMethod called");
}

+ (void)testClassMethod{
    NSLog(@"testClassMethod called");
}

@end
