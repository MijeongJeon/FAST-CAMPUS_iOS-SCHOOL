//
//  SettingTableViewController.m
//  CustomTable
//
//  Created by Mijeong Jeon on 6/8/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "SettingTableViewController.h"
#import "SettingTableViewCell.h"
#import "DataCenter.h"
#import "WeatherTableViewController.h"

@interface SettingTableViewController ()
<UITableViewDelegate, UITableViewDataSource, SettingTableViewCellDelegate>
@property (nonatomic, strong) DataCenter *dataCenter;

@end

@implementation SettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataCenter = [DataCenter defaultData];
    [self.navigationItem setTitle:@"Setting & Weather"];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
// 섹션 수
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.dataCenter numberOfSectionForSettingTable];
}

// 로우 수
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   
    return [self.dataCenter numberOfRowsForSectionInSettingTable:section];
}

// 셀 속성
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *dataArray  = [self.dataCenter settingTableDataForSection:indexPath.section]; // 제목 어레이
    NSString *text = [dataArray objectAtIndex:indexPath.row]; // 각각 제목
    
    if (indexPath.section == 0) {
        SettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SettingCell"];

        if (cell == nil) {
            cell = [[SettingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
              
                                               reuseIdentifier:@"SettingCell"];
            //cell이 생성되는 시점에 switch를 생성해 준다.
            
            cell.delegate = self;
            cell.selectionStyle = UITableViewCellAccessoryNone;
            
        }
        
        [cell.textLabel setText:text];
        
        BOOL isFunctionOn = [self.dataCenter isOnForSetting:indexPath.row];
        [cell.settingSwitch setOn:isFunctionOn];
        return cell;
        
        // 첫번째 섹션은 스위치가 들어있는 셀로 만든다.
        
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SubtitleCell"
                                                                forIndexPath:indexPath];
        
        // UIView에 올릴때에는 if (cell == nil) 체크를 해서 객체를 생성해줘야 하지만 스토리보드에서 이미 셀이 생성되어있음!
        [cell.textLabel setText:text];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        return cell;
    }
}

// 헤더 제목 설정
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.dataCenter settingHeaderTitleForSection:section];
}

// 스위치가 변했을때 각각 스위치가 변했음을 유저 디폴트에 저장
- (void)settingTableViewCellSwitchVauleChanged:(SettingTableViewCell *)cell isOn:(BOOL)isOn {
    NSIndexPath *cellIndex = [self.tableView indexPathForCell:cell];
    
    [self.dataCenter setSettingOn:cellIndex.row isOn:isOn];
    NSLog(@"Cell Index : %ld - %ld, isOn : %d", cellIndex.section, cellIndex.row, isOn);
}


// 셀 선택했을때 선택 해제 해줌, 어떤 셀이 선택되었는지 넘겨줌
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Row Selected : %ld - %ld", indexPath.section, indexPath.row);
    if (indexPath.section == 0) {
        return;
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    // 다음화면으로 보내기 전에 선택을 해제해줌

    UITableViewCell *sender = [tableView cellForRowAtIndexPath:indexPath];
    
    [self performSegueWithIdentifier:@"ShowDetailWeather" sender:sender];
    // 어떤 셀이 선택되었는지 정보를 sender에 너어줌
    
    
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation
// 다음 화면으로 넘어갈때 한국날씬지 세계날씬지 구별해서 넘겨줌
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    UITableViewCell *senderCell = (UITableViewCell *)sender;
    NSLog(@"segue will action : %@", senderCell.textLabel.text);
    
    WeatherTableViewController *tableViewController = segue.destinationViewController;
    
    if ([senderCell.textLabel.text isEqualToString:@"Korea Weather"]) {
        tableViewController.weatherTpye = WeatherTypeKorea;
    } else {
        tableViewController.weatherTpye = WeatherTypeWorld;
    }
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
