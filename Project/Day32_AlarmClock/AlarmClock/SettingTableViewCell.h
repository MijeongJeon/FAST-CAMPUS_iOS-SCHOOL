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

@property (weak, nonatomic) id <SettingTableViewCellDelegate> delegate;

@property (weak, nonatomic) UISwitch *switchOnOff;
@property (weak, nonatomic) UILabel *timeLabel;
@property (weak, nonatomic) UILabel *timeZoneLabel;
@property (weak, nonatomic) UILabel *detailLabel1;
@property (weak, nonatomic) UILabel *detailLabel2;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withRow:(NSInteger)row;

@end
