//
//  DataCenter.h
//  CustomTable
//
//  Created by Mijeong Jeon on 6/8/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherTableViewController.h"

typedef NS_ENUM(NSInteger, SettingRow) {
    SettingRowSound = 0,
    SettingRowVibration
};

@interface DataCenter : NSObject

+ (instancetype)defaultData;

- (NSInteger)numberOfSectionForSettingTable;
- (NSArray *)settingTableDataForSection:(NSInteger)section;
- (NSInteger)numberOfRowsForSectionInSettingTable:(NSInteger)setion;
- (NSString *)settingHeaderTitleForSection:(NSInteger)section;
- (void)setSettingOn:(SettingRow)function isOn:(BOOL)isOn;
- (BOOL)isOnForSetting:(SettingRow)function;
- (NSArray *)dataForWeather:(WeatherType)type;

@end
