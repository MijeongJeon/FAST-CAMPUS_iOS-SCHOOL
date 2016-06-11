//
//  SettingTableViewCell.h
//  AlarmClock
//
//  Created by Mijeong Jeon on 6/9/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SettingTableViewCell;

@protocol SettingTableViewCellDelegate <NSObject>

- (void)settingTableViewSwitchValueChanged:(UITableViewCell *)cell isOs:(BOOL)isOn;

@end

                                            
@interface SettingTableViewCell : UITableViewCell

@property (nonatomic, weak) id <SettingTableViewCellDelegate> delegate;

@property (nonatomic, strong) UISwitch *switchOnOff;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *timeZoneLabel;
@property (nonatomic, strong) UILabel *detailLabel1;
@property (nonatomic, strong) UILabel *detailLabel2;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withRow:(NSInteger)row;

@end
