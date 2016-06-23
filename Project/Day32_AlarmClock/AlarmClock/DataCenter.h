//
//  DataCenter.h
//  AlarmClock
//
//  Created by Mijeong Jeon on 6/9/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataCenter : NSObject
@property (strong, nonatomic) NSArray *settingTime;
@property (strong, nonatomic) NSArray *detailSettingLabel1;
@property (strong, nonatomic) NSArray *detailSettingLabel2;
@property (strong, nonatomic) NSArray *settingTimeZone;

+ (instancetype)defaultData;

- (NSDictionary *)dataForRow:(NSInteger)index;
- (NSArray *)alramList;

- (void)insertNewDataForRow:(NSDictionary *)newDic;
- (void)removeDataAtIndex:(NSInteger)row;

- (void)switchOnOff:(BOOL)isOn index:(NSInteger)row;
- (BOOL)isSwitchON:(NSInteger)row;

@end

