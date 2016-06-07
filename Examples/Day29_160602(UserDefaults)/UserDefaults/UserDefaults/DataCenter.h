//
//  DataCenter.h
//  UserDefaults
//
//  Created by Mijeong Jeon on 6/2/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataCenter : NSObject

// 싱글톤 변수의 클래스 메소드
+ (instancetype)sharedInstance ;
- (void)printData;

@property (nonatomic, strong) NSString *name;
@property (nonatomic) NSInteger age;


@end
