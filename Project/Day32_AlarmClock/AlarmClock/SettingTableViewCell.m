//
//  SettingTableViewCell.m
//  AlarmClock
//
//  Created by Mijeong Jeon on 6/9/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "SettingTableViewCell.h"
#import "DataCenter.h"

@implementation SettingTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)switchValueChanged:(UISwitch *)sender {
    [self.delegate settingTableViewSwitchValueChanged:self
                                                 isOs:sender.isOn];
    NSLog(@"Switch %d", sender.isOn);

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withRow:(NSInteger)row{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    
    UILabel *timeLabel = [[UILabel alloc] init];
    UILabel *timeZoneLabel = [[UILabel alloc] init];
    UILabel *detailLabel1 = [[UILabel alloc] init];
    UILabel *detailLabel2 = [[UILabel alloc] init];
   
    timeLabel.font = [UIFont systemFontOfSize:45];
    timeZoneLabel.font = [UIFont systemFontOfSize:20];
    detailLabel1.font = [UIFont boldSystemFontOfSize:17];
    detailLabel2.font = [UIFont systemFontOfSize:17];
    
    
    [self.contentView addSubview:timeLabel];
    [self.contentView addSubview:timeZoneLabel];
    [self.contentView addSubview:detailLabel1];
    [self.contentView addSubview:detailLabel2];

    self.timeLabel = timeLabel;
    self.timeZoneLabel = timeZoneLabel;
    self.detailLabel1 = detailLabel1;
    self.detailLabel2 = detailLabel2;
    
    
    UISwitch *switchOnOff = [[UISwitch alloc] init];
    self.accessoryView = switchOnOff;
    [self.switchOnOff addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
    switchOnOff = self.switchOnOff;
    
    return self;
}


@end
