//
//  DataCenter.m
//  CustomTable
//
//  Created by Mijeong Jeon on 6/8/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "DataCenter.h"

static NSString *const keySoundSetting = @"UserSoundIsOn";
static NSString *const keyVibrationSetting = @"UserVibrationIsOn";

@interface DataCenter()

@property (nonatomic, strong) NSArray *settingTableData;
@property (nonatomic, strong) NSString *weatherData;
@property (nonatomic, strong) NSArray *settingHeaderTitle;


@end

@implementation DataCenter

+ (instancetype)defaultData {
    static DataCenter *dataCenter = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataCenter = [[DataCenter alloc] init];
        dataCenter.settingTableData = @[ @[@"Sound", @"Vibration"], @[@"World Weather", @"Korea Weather"]];
        dataCenter.settingHeaderTitle = @[ @"Setting", @"Weather"];

    });
    return dataCenter;
}

// 섹션의 수
- (NSInteger)numberOfSectionForSettingTable {
    return 2;
}

// 각 섹션의 내용
- (NSArray *)settingTableDataForSection:(NSInteger)section {
    return (NSArray *)self.settingTableData[section];
}

// 각 섹션의 로우 수
- (NSInteger)numberOfRowsForSectionInSettingTable:(NSInteger)setion {
    return [[self settingTableDataForSection:setion] count];
}

// 각 섹션 제목
- (NSString *)settingHeaderTitleForSection:(NSInteger)section {
    return (NSString *)self.settingHeaderTitle[section];
}

// 스위치가 켜젔는지 꺼졌는지 값 저장
-(void)setSettingOn:(SettingRow)function isOn:(BOOL)isOn {
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults]; // NSDefault생성

    NSString *key = nil;
    
    if (function == SettingRowSound) {
        key = keySoundSetting;
    } else {
        key = keyVibrationSetting;
    }
    [userDefault setBool:isOn forKey:key];
    NSLog(@"저장되었습니다.");
    [userDefault synchronize];
}

// 스위치 켜젔는지 꺼졌는지 값 호출
- (BOOL)isOnForSetting:(SettingRow)function {
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    NSString *key = nil;
    
    if (function == SettingRowSound) {
        key = keySoundSetting;
    } else {
        key = keyVibrationSetting;
    }
    NSLog(@"불러왔어요");
    return [userDefault boolForKey:key];
}

- (NSArray *)dataForWeather:(WeatherType)type {
    if (type == WeatherTypeKorea) {
        return @[@"Seoul",@"Busan",@"Daejeon", @"Daegu"];
    } else {
        return @[@"Seoul",@"New York", @"Paris", @"Rome"];
    }
}


@end
