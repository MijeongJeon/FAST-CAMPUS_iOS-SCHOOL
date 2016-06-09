//
//  EditTableViewController.m
//  TableEditing
//
//  Created by Mijeong Jeon on 6/9/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "EditTableViewController.h"
#import "DataCenter.h"

@interface EditTableViewController ()

@property (nonatomic, strong) DataCenter *dataCenter;

@end

@implementation EditTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataCenter = [DataCenter defaultData];
    
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
// 섹션 수 설정
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

// 섹션 마다 로우 수 설정(어레이에 들어있는 객체 수)
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.dataCenter dataForSection:section] count];
}


// 셀 객체 생성 및 데이터 입력
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EditCell" forIndexPath:indexPath];
    NSMutableArray *data = [self.dataCenter dataForSection:indexPath.section];
    NSString *text = [data objectAtIndex:indexPath.row];
    
    cell.textLabel.text = text;

    // Configure the cell...
    
    return cell;
}

// +버튼 액션 설정
- (IBAction)clickInsertNewItemButton:(id)sender {
    
    NSLog(@"click to add");
    
    NSArray *array = [self.dataCenter dataForSection:1]; // 첫번째 섹션을 어레이로 가져온다.
    NSIndexPath *path = [NSIndexPath indexPathForRow:array.count inSection:1];
    // 첫번째 섹션의 어레이에 들어있는 객체의 갯수가 새로운 데이터가 추가될 곳이다!!!

    [self.dataCenter insertNewDataForSecondSection];
    [self.tableView insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationFade];

}


// 모든 인덱스에서 편집을 가능하도록 하겠다.
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// 어디서 삭제/추가가 가능하게 만들것이냐??(하나씩밖에 선택되지 않음ENUM, 버튼을 이용해서 추가 기능 설정 가능)
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return UITableViewCellEditingStyleDelete;
    }
    return UITableViewCellEditingStyleInsert;
}

// 삭제될시에 실제로 이루어질 행동들(데이터를 먼저 삭제해줘야함)
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [self.dataCenter removeFirstSectionDataAtIndexes:indexPath.row]; //  데이터 소스의 객체를 먼저 지운다
        // Delete the row from the data source
        // (테이블 뷰의 로우를 삭제한다.)(삭제하는 순간 데이터 소스의 데이터와 비교를 한다. 비교개수가 맞지 않으면 죽는다.)
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {


        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
