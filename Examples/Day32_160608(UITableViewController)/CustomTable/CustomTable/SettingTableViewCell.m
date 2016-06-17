
//
//  SettingTableViewCell.m
//  CustomTable
//
//  Created by Mijeong Jeon on 6/8/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "SettingTableViewCell.h"
#import "DataCenter.h"

@implementation SettingTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)switchValueChanged:(UISwitch *)sender{
    [self.delegate settingTableViewCellSwitchVauleChanged:self
                                                     isOn:sender.isOn];
    NSLog(@"Switch %d", sender.isOn);
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect]; // cell이 화면에 표시될때마다 호출되는 구문
    
//    if (self.titlelabel == nil) { // 라벨이 없으면
//        self.titlelabel  = [[UILabel alloc] initWithFrame:CGRectMake(5.0f, 5.0f, 200.0f, 30.0f)]; // 생성
//        [self.contentView addSubview:self.titlelabel]; // 컨텐츠뷰에 올려준다.(컨텐츠뷰에는 여러개 뷰 올라갈수 있음)
//    }
    
//    if (self.settingSwitch == nil) { // 스위치가 없으면
//        self.settingSwitch = [[UISwitch alloc] init]; // 생성하고
//        self.accessoryView = self.settingSwitch; // 악세서리뷰로 설정해준다.(악세서리뷰에는 뷰 1개가 설정가능)
//        [self.settingSwitch addTarget:self
//                               action:@selector(switchValueChanged:)
//                     forControlEvents:UIControlEventValueChanged];
//
//    }
}

// switch가 생성되는 시점, cell이 생성되는 시점과 switch설정을 입력하는 시점이 달라서 생기는 문제를 해결하기 위해 switch생성 시점을 변경해줌
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
        self.settingSwitch = [[UISwitch alloc] init]; // 생성하고
        self.accessoryView = self.settingSwitch; // 악세서리뷰로 설정해준다.(악세서리뷰에는 뷰 1개가 설정가능)
        [self.settingSwitch addTarget:self
                               action:@selector(switchValueChanged:)
                     forControlEvents:UIControlEventValueChanged];
        return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
