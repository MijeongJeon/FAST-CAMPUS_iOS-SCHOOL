//
//  SchoolTableViewController.m
//  Database(CoreData)
//
//  Created by Mijeong Jeon on 6/22/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "SchoolTableViewController.h"
#import "AppDelegate.h"
#import "School+CoreDataProperties.h"

@interface SchoolTableViewController ()

@property (weak, nonatomic) AppDelegate *appDelegate;
@property (weak, nonatomic) NSManagedObjectContext *manageObjectContext;
@property (strong, nonatomic) NSMutableArray<School *> *school;

@end

@implementation SchoolTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 앱의 어플리케이션 싱글톤을 부름 - 그것의 델리게이트가 바로 앱델리게이트!
    _appDelegate = [[UIApplication sharedApplication] delegate];
    
    // 앱 델리게이트의 오브젝트콘텍스트매니지를 부름
    _manageObjectContext = _appDelegate.managedObjectContext;
    
    // 스쿨이라는 엔티티에 있는 자료를 모두 나에게 달라고 하는 요청서 생성
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"School"];
    
    NSError *fetchError = nil;
    
    NSArray<School *> *fetchResult = [_manageObjectContext executeFetchRequest:fetchRequest
                                                                         error:&fetchError];
    
    NSLog(@"School array: %@, fetchError: %@", fetchResult,fetchError);
    
    // 불러오는데 오류가 생기면 fetchError에 담긴다
    if (fetchError != nil) {
        NSLog(@"fetchError:%@",fetchError);
    } else {
        NSLog(@"fetch Success");
    // 불러오는데 성공하면 불러온 것을 뮤터블 어레이에 넣어준다.
        _school = [NSMutableArray arrayWithArray:fetchResult];
    }
    
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _school.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SchoolCell"
                                                            forIndexPath:indexPath];
    
    School *schoolInfo = [self.school objectAtIndex:indexPath.row];
    cell.textLabel.text = schoolInfo.name;
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


// + 버튼 액션
#pragma mark - Add Button Action

- (IBAction)clickAddButton:(id)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"School"
                                                                   message:@"Add School Name"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *addAction = [UIAlertAction actionWithTitle:@"Add"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction * _Nonnull action) {
                                                          UITextField *field = alert.textFields.firstObject;
                                                          NSString *inputText = field.text;
                                                          
                                                          if ([inputText length] != 0) {
                                                              NSLog(@"%@", inputText);
                                                              [self saveNewSchoolEntity:inputText];
                                                          }
                                                          
                                                      }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                        style:UIAlertActionStyleCancel
                                                      handler:^(UIAlertAction * _Nonnull action) {
                                                          
                                                      }];
    

    [alert addAction:addAction];
    [alert addAction:cancelAction];
    
    // 알럿에 사용자의 입력을 받기위해 텍스트 필드를 추가한다
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        // 블럭 내부에는 텍스트 필드의 폰트, 모양, 플레이스 폴더 등의 설정을 위한 코드를 넣어줄 수 있다.
        [textField setPlaceholder:@"School Name"];
    }];

    [self presentViewController:alert animated:YES completion:nil];
    
}

#pragma mark - Save New Data

- (void)saveNewSchoolEntity:(NSString *)name {
    
    // 스쿨 엔티티 객체 생성
   School *schoolToAdd = [NSEntityDescription insertNewObjectForEntityForName:@"School"
                                                        inManagedObjectContext:_manageObjectContext];
    // 스쿨 객체에 이름 넣어준다
    schoolToAdd.name = name;
    
    // 코어데이터에 저장!
    [self.appDelegate saveContext];
    
    // 펫치해서 가져온 뮤터블에 추가된 것을 더해준다.
    [self.school addObject:schoolToAdd];
    
    // 테이블 전체를 리로드한다.(새로 추가된 것까지 함께 보여주기 위해서)
    [self.tableView reloadData];
}


@end
