//
//  SettingTableViewCell.h
//  CustomTable
//
//  Created by Mijeong Jeon on 6/8/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SettingTableViewCell;

@protocol SettingTableViewCellDelegate <NSObject>
// 스위치 값이 변경되었을때 호출할 메소드(나 **cell인데 스위치값이(isOn)이 변경되었어)
- (void)settingTableViewCellSwitchVauleChanged:(SettingTableViewCell *)cell isOn:(BOOL)isOn;

@end

@interface SettingTableViewCell : UITableViewCell

//@property (nonatomic, strong) UILabel *titlelabel;
@property (nonatomic, weak) id<SettingTableViewCellDelegate> delegate;
// 어떤 타입이든 <>프로토콜을 따르면 delegate가 될 수있다.
@property (nonatomic, strong) UISwitch *settingSwitch;

@end
