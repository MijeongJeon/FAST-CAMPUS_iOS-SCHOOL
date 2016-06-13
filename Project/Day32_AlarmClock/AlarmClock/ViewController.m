//
//  ViewController.m
//  AlarmClock
//
//  Created by Mijeong Jeon on 6/9/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "ViewController.h"
#import "SettingTableViewCell.h"
#import "DataCenter.h"
#import "DetailViewController.h"

@interface ViewController ()
<UITableViewDelegate, UITableViewDataSource, SettingTableViewCellDelegate>
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped]; // 테이블 뷰 객체 생성
    self.tableView.delegate = self; // 테이블 뷰 델리게이트 호출
    self.tableView.dataSource = self; // 테이블 뷰 데이터 소스 호출
    [self.view addSubview:self.tableView];// 테이블 뷰 화면에 생성
    [self creatNavigationBar]; // 네이게이션 바 생성
//    NSLog(@"%d",[[DataCenter defaultData] isSwitchON:self.tableView.indexPathForSelectedRow.row]);
}


//*************** 테이블 뷰, 셀 형태 ********************
//                                                  *
//                                                  *
//                                                  *
//***************************************************

// row 수(어레이별 객체 수)
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[DataCenter defaultData] alramList].count;
}

// 셀 설정 및 데이터 호출
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil) {
        cell = [[SettingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell" withRow:indexPath.row];
    
        cell.delegate = self;
    }
    
    NSDictionary *dic = [[DataCenter defaultData] dataForRow:indexPath.row];
    [cell.timeZoneLabel setText:[dic objectForKey:@"amPm"]];
    [cell.timeLabel setText:[dic objectForKey:@"time"]];
    [cell.detailLabel1 setText:[dic objectForKey:@"comment"]];
    [cell.detailLabel2 setText:[dic objectForKey:@"days"]];
    
    [cell.timeLabel sizeToFit];
    [cell.timeZoneLabel sizeToFit];
    [cell.detailLabel1 sizeToFit];
    [cell.detailLabel2 sizeToFit];
    
    [cell.timeLabel
     setFrame:CGRectMake(20, 15, cell.timeLabel.frame.size.width, cell.timeLabel.frame.size.height)];
    [cell.timeZoneLabel
     setFrame:CGRectMake(30 + cell.timeLabel.frame.size.width, cell.timeLabel.frame.size.height - cell.timeZoneLabel.frame.size.height + 10, cell.timeLabel.frame.size.width, cell.timeZoneLabel.frame.size.height)];
    [cell.detailLabel1
     setFrame:CGRectMake(20, cell.timeLabel.frame.size.height+20, cell.detailLabel1.frame.size.width, cell.detailLabel1.frame.size.height)];
    [cell.detailLabel2
     setFrame:CGRectMake(25+cell.detailLabel1.frame.size.width, cell.timeLabel.frame.size.height+20, cell.detailLabel2.frame.size.width, cell.detailLabel2.frame.size.height)];
    
    
//    [cell.timeZoneLabel setBackgroundColor:[UIColor redColor]];
//    [cell.timeLabel setBackgroundColor:[UIColor blueColor]];
//    [cell.detailLabel2 setBackgroundColor:[UIColor greenColor]];
//    [cell.detailLabel1 setBackgroundColor:[UIColor blackColor]];

    
    return cell;
}

// 셀 높이 조절
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 110;
}


//*************** 셀 삭제, 추가 기능 ********************
//                                                  *
//                                                  *
//                                                  *
//***************************************************

// 수정 허용
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

// 삭제 허용
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}
// 삭제 행동
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [[DataCenter defaultData] removeDataAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

//*************** 네비게이션설정,이동 ********************
//                                                  *
//                                                  *
//                                                  *
//***************************************************

// 네비게이션 생성 및 버튼생성
- (void)creatNavigationBar {
    self.navigationItem.title = @"Alarm";
    
    [self.editButtonItem setTintColor:[UIColor redColor]];
     self.navigationItem.leftBarButtonItem = self.editButtonItem;

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addActionButton:)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor redColor];
}


// edit 버튼 테이블 뷰에서 사용가능하도록 오버로딩
- (void) setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:animated];
//    if (editing) {
//        // you might disable other widgets here... (optional)
//    } else {
//        // re-enable disabled widgets (optional)
//    }
}


// 더하기 버튼
- (void)addActionButton:(id)sender{
        
    [self tableView:self.tableView didSelectRowAtIndexPath:self.tableView.indexPathForSelectedRow];
}

// 셀 선택시 다음 뷰 이동
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath  {
    DetailViewController *detailView = [[DetailViewController alloc] init];
    [self.navigationController pushViewController:detailView animated:NO];
}

//*************** 스위치 설정값 저장 ********************
//                                                  *
//                                                  *
//                                                  *
//***************************************************

// 스위치 설정 값 유저 디폴트에 저장
- (void)settingTableViewSwitchValueChanged:(UITableViewCell *)cell isOs:(BOOL)isOn {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    [[DataCenter defaultData] switchOnOff:isOn index:indexPath.row];
    NSLog(@"%ld-%ld switch %d",indexPath.section, indexPath.row, isOn);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
