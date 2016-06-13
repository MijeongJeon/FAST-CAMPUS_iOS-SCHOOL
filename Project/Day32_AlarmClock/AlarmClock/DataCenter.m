//
//  DataCenter.m
//  AlarmClock
//
//  Created by Mijeong Jeon on 6/9/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "DataCenter.h"

@interface DataCenter()

@property (nonatomic) NSMutableArray * alrams;

@end


@implementation DataCenter

+ (instancetype)defaultData {
    static DataCenter *dataCenter = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataCenter = [[DataCenter alloc] init];
    });
    
    return dataCenter;
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        [self setAlrams];
    }
    return self;
}
// 알람 객체 생성
- (void)setAlrams {
    
    self.alrams = [[NSMutableArray alloc] initWithObjects:
    @{@"time":@"6:25", @"amPm":@"AM", @"comment":@"Alarm,", @"days":@"Weekdays"},
    @{@"time":@"7:10", @"amPm":@"AM", @"comment":@"Alarm,", @"days":@"MON"},
    @{@"time":@"10:30", @"amPm":@"AM", @"comment":@"Alarm", @"days":@""},
    @{@"time":@"2:25", @"amPm":@"PM", @"comment":@"Metting with boss,", @"days":@"Weekdays"},
    @{@"time":@"6:55", @"amPm":@"PM", @"comment":@"Wake Up", @"days":@""}, nil];
    
}
// 전체 알람 접근자
- (NSArray *)alramList {
    return self.alrams;
}
// 알람 내 객체 접근자
- (NSDictionary *)dataForRow:(NSInteger)index {
    return self.alrams[index];
}

// 추가
- (void)insertNewDataForRow:(NSDictionary *)newDic {
    return [self.alrams addObject:newDic];
}
// 제거
- (void)removeDataAtIndex:(NSInteger)row {
    [self.alrams removeObjectAtIndex:row];
}
// 스위치 설정값 변경 저장
- (void)switchOnOff:(BOOL)isOn index:(NSInteger)row {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setBool:isOn forKey:[[self dataForRow:row] objectForKey:@"isSwitchOn"]];
    
}

// 스위치 설정값 호출
- (BOOL)isSwitchON:(NSInteger)row {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    return [userDefaults objectForKey:[[self dataForRow:row] objectForKey:@"isSwitchOn"]];
    
}

@end
