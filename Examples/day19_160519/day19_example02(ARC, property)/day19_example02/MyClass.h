//
//  MyClass.h
//  day19_example02
//
//  Created by Mijeong Jeon on 5/19/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyClass : NSObject {
    NSInteger _age;   // {_내부 변수} - 외부에서 알 수 없음. 접근 불가
}

- (NSInteger)age;
- (void)setAge:(NSInteger)age;


@property (strong, nonatomic) NSString *name; // 내부변수, setter, getter 자동 설정

@end
