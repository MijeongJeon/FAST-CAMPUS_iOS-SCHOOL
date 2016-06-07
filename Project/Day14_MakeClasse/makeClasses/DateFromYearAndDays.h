//
//  DateFromYearAndDays.h
//  makeClasses
//
//  Created by Mijeong Jeon on 5/12/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateFromYearAndDays : NSObject

- (void)setYearAndDays:(NSInteger)year Days:(NSInteger)days; // 연도, 일자 받는 메소드
- (void)findMonthAndDate; // 결과물 출력 메소드

@end
