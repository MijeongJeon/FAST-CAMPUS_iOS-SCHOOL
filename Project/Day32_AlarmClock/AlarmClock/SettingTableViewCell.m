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
    
    self.timeLabel = [[UILabel alloc] init];
    self.timeZoneLabel = [[UILabel alloc] init];
    self.detailLabel1 = [[UILabel alloc] init];
    self.detailLabel2 = [[UILabel alloc] init];
   
    self.timeLabel.font = [UIFont systemFontOfSize:45];
    self.timeZoneLabel.font = [UIFont systemFontOfSize:20];
    self.detailLabel1.font = [UIFont boldSystemFontOfSize:17];
    self.detailLabel2.font = [UIFont systemFontOfSize:17];
    
    
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.timeZoneLabel];
    [self.contentView addSubview:self.detailLabel1];
    [self.contentView addSubview:self.detailLabel2];

    self.switchOnOff = [[UISwitch alloc] init];
    self.accessoryView = self.switchOnOff;
    [self.switchOnOff addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    return self;
}


@end
