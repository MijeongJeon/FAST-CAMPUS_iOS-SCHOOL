//
//  main.m
//  day19_example02
//
//  Created by Mijeong Jeon on 5/19/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyClass.h"

//////////////////////////////////////

@interface TestClass : NSObject

@end


@implementation TestClass


// ACR test
- (void)dealloc {
    
//    NSLog(@"Test Class dealloc");

//    [super dealloc];
}

@end

__weak TestClass *globalReference = nil;

//////////////////////////////////////

void test() {
    TestClass *testInstance = [[TestClass alloc] init];
    
   globalReference = testInstance;
    
//    NSLog(@"%ld", [testInstance retainCount]);
//    
//    [testInstance retain];
//    NSLog(@"%ld", [testInstance retainCount]);
//
//    [testInstance release];
//    NSLog(@"%ld", [testInstance retainCount]);
//    
//    [testInstance release];
//    NSLog(@"%ld", [testInstance retainCount]);
    
    // retainCount는 참고용. 맹신하면 안됌(MRC에서만 사용가능)

}


int main(int argc, const char * argv[]) {
    
    test();
    MyClass *myInstance = [[MyClass alloc] init];
    
    [myInstance setName:@"MJ"];
    NSLog(@"%@",[myInstance name]);
    
    [myInstance setAge:23];
    NSLog(@"%ld",[myInstance age]);
    
    return 0;
}
