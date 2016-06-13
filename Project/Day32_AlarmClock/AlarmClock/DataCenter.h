//
//  DataCenter.h
//  AlarmClock
//
//  Created by Mijeong Jeon on 6/9/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataCenter : NSObject
@property (nonatomic, strong) NSArray *settingTime;
@property (nonatomic, strong) NSArray *detailSettingLabel1;
@property (nonatomic, strong) NSArray *detailSettingLabel2;
@property (nonatomic, strong) NSArray *settingTimeZone;

- (NSDictionary *)dataForRow:(NSInteger)index;
+ (instancetype)defaultData;
- (NSArray *)alramList;
- (void)insertNewDataForRow:(NSDictionary *)newDic;
- (void)removeDataAtIndex:(NSInteger)row;

- (void)switchOnOff:(BOOL)isOn index:(NSInteger)row;
- (BOOL)isSwitchON:(NSInteger)row;

@end

