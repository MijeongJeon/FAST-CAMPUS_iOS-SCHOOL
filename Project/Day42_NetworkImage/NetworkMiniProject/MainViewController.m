//
//  MainViewController.m
//  NetworkMiniProject(107)
//
//  Created by Mijeong Jeon on 6/22/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "MainViewController.h"
#import "SecondViewController.h"

@interface MainViewController ()
<UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) UITableView *tableView;
#pragma mark - User Info
@property (strong, nonatomic) NSString *userID;

#pragma mark - Table Cell Data
@property (strong, nonatomic) NSMutableArray *imageArray;
@property (strong, nonatomic) NSMutableArray *imageNameArray;


@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTableView];
    [self layoutNavigation];
    
    self.imageArray = [[NSMutableArray alloc] initWithCapacity:1];
    self.imageNameArray = [[NSMutableArray alloc] initWithCapacity:1];
}

#pragma mark - Navigation View
- (void)layoutNavigation {
    [self.navigationItem setTitle:@"Images"];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                              initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                                              target:self
                                              action:@selector(actionButton:)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
                                             initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                             target:self
                                             action:@selector(refreshButton:)];
}

// 왼쪽 액션 버튼 누르면 새로운 이미지 업로드(이미지 피커뷰)
- (void)actionButton:(UIBarButtonItem *)sender {
    [self showImagePicherController];
}


// 오른쪽 리프레쉬 버튼 누르면 테이블 뷰 데이터 리로드
- (void)refreshButton:(UIBarButtonItem *)sender {
    [self.tableView reloadData];
}


#pragma mark - TableView
- (void)createTableView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.imageArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    [cell.textLabel setFont:[UIFont systemFontOfSize:17]];
    [cell.textLabel setTextColor:[UIColor blackColor]];
    
    [cell.textLabel setText:[self.imageNameArray objectAtIndex:indexPath.row]];
    [cell.imageView setImage:[self.imageArray objectAtIndex:indexPath.row]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

// 셀이 선택되었을때 상세 화면으로 넘어감
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    secondVC.image = self.imageArray[indexPath.row];
    [self.navigationController pushViewController:secondVC animated:YES];
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - First Alert
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    if (self.userID == nil) {
        // alert 객체 생성
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Login" message:@"Insert User ID" preferredStyle:UIAlertControllerStyleAlert];
        
        // alert 액션 생성 및 행동 지정
        UIAlertAction *login = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            UITextField *textField = alert.textFields.firstObject;
            self.userID = textField.text;
            NSLog(@"user id:%@",self.userID);
        }];
        
        [alert addAction:login];
        [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            
        }];
        [alert.view setNeedsLayout];
        [self presentViewController:alert animated:YES completion:nil];
    }

}

#pragma mark - ImagePickerController
// 이미지 피커뷰 생성
- (void)showImagePicherController {
    UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
    [pickerController setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    pickerController.delegate = self;
    
    [self presentViewController:pickerController animated:YES completion:nil];
}

// 이미지가 선택되었을때
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    UIImage *pickeredImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    // 선택된 사진을 어레이에 추가함
    [self.imageArray addObject:pickeredImage];
    
    // 선택 후 피커 뷰 내려줌
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    // 선택 후 이름 지정 알럿 띄어줌
    // alert 객체 생성
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Image Name" message:@"Insert Image Name" preferredStyle:UIAlertControllerStyleAlert];
    
    
    // alert 액션 생성 및 행동 지정
    UIAlertAction *insertName = [UIAlertAction actionWithTitle:@"OK"
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * _Nonnull action) {
                                                           UITextField *textField = alert.textFields.firstObject;
                                                           NSLog(@"image name:%@",textField.text);
                                                           [self.imageNameArray addObject:textField.text];
                                                           [self.tableView reloadData];
                                                       }];
    
    [alert addAction:insertName];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
    }];
    [alert.view setNeedsLayout];
    [self presentViewController:alert animated:YES completion:^{
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
