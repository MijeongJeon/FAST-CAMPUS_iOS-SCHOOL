//
//  MainViewController.m
//  NetworkMiniProject(107)
//
//  Created by Mijeong Jeon on 6/22/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "MainViewController.h"
#import "SecondViewController.h"
#import "RequestObject.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface MainViewController ()
<UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) UITableView *tableView;

@property (strong, nonatomic) NSArray *imageList;

@property (strong, nonatomic) RequestObject *requestObject;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTableView];
    [self layoutNavigation];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(refreshTableView)
                                                 name:ImageListUpdatedNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self.requestObject
                                             selector:@selector(requestImageList)
                                                 name:ImageUpLoadDidSuccessNotification
                                               object:nil];
    
    self.imageList = [[NSMutableArray alloc] initWithCapacity:1];
    
    self.requestObject = [RequestObject sharedInstance];
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
    [self refreshTableView];
}


#pragma mark - TableView
- (void)createTableView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView = tableView;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.imageList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    // 딕셔너리 가져옴
    NSDictionary *imageInfo = self.imageList[indexPath.row];
    
    // 딕셔너리의 그림 이름 셀에 설정
    NSString *imageTitle = imageInfo[JSONKeyImageTitle];
    cell.textLabel.text = imageTitle;
    
    // 딕셔너리의 그림을 셀에 설정
    NSString *thumbnailURLString = imageInfo[JSONKeyThumbnailURL];
    NSURL *thumbnailURL = [NSURL URLWithString:thumbnailURLString];
    
//    cell.imageView.image = [UIImage imageNamed:@"placeholder"];
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;

// 셀.이미지 뷰에 서버 이미지 가져오는 방법 1 ~ 3//
// ***********************
// 1. Apple_imageWithData : 이미지를 메인스레드에서 다운받는 방식으로, 다운로드가 종료될 때까지 다른 작업이 기다려야함
// ***********************
    
    //    cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:thumbnailURL]];
    
    
// ***********************
// 2. Apple_NSURLSession
// ***********************
    
    //    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithURL:thumbnailURL
    //completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    //    
    //    if (data) {
    //        UIImage *image = [UIImage imageWithData:data];
    //        if (image) {
    //            dispatch_async(dispatch_get_main_queue(), ^{
    //                // 인덱스 꼬이지 말라고 해당 셀을 불러와서 이미지를 넣어줌
    //                UITableViewCell *cellForUpdate = [tableView cellForRowAtIndexPath:indexPath];
    //                cellForUpdate.imageView.image = image;
    //            });
    //        }
    //    }
    //    }];
    //    
    //    [task resume];
    
// ***********************
// 3. Pod_SDWebImage (URL에 있는 이미지를 imageView에 가져와준다!!)
// ***********************
    
    [cell.imageView sd_setImageWithURL:thumbnailURL placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    
    // 셀 속성 조절
    [cell.textLabel setFont:[UIFont systemFontOfSize:17]];
    [cell.textLabel setTextColor:[UIColor blackColor]];
    
    return cell;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 70;
//}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

// 셀이 선택되었을때 상세 화면으로 넘어감
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    
    NSString *imageURLString = self.imageList[indexPath.row][JSONKeyImageURL];
    NSLog(@"%@",self.imageList[indexPath.row][JSONKeyImageURL]);
    NSURL *imageURL = [NSURL URLWithString:imageURLString];

    secondVC.imageURL = imageURL;
    secondVC.imageName = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
                                    
    [self.navigationController pushViewController:secondVC animated:YES];
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - First Alert
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
    if (self.requestObject.userID == nil) {
        // alert 객체 생성
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Login" message:@"Insert User ID" preferredStyle:UIAlertControllerStyleAlert];
        
        // alert 액션 생성 및 행동 지정
        UIAlertAction *login = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            UITextField *textField = alert.textFields.firstObject;
            self.requestObject.userID = textField.text;
            NSLog(@"user id:%@",self.requestObject.userID);
            
            [self.requestObject requestImageList];
            
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
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
        pickerController.delegate = self;
        
        [pickerController setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        
        [self presentViewController:pickerController animated:YES completion:nil];
 
    }

}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil]; // 모달을 내려준다.
}

// 이미지가 선택되었을때
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
//    UIImage *pickedImage = [[UIImage alloc] init];
//    pickedImage = nil;
    
    UIImage *pickedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    // 선택 후 피커 뷰 내려줌
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    // 선택 후 이름 지정 알럿 띄어줌
    // alert 객체 생성
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Image Name" message:@"Insert Image Name" preferredStyle:UIAlertControllerStyleAlert];
    
    
    // alert 액션 생성 및 행동 지정
    UIAlertAction *insertName = [UIAlertAction actionWithTitle:@"OK"
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * _Nonnull action) {
                                                           UITextField *title = alert.textFields.firstObject;
                                                           NSLog(@"image name:%@",title.text);
                                                           
                                                           [self.requestObject uploadImage:pickedImage title:title.text];
                                                           
                                                       }];
    
    [alert addAction:insertName];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
    }];
    [alert.view setNeedsLayout];
    [self presentViewController:alert animated:YES completion:^{
    }];
}

- (void)refreshTableView {
    self.imageList = self.requestObject.imageInfoJSONArray;
    dispatch_async(dispatch_get_main_queue(), ^{
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        [self.tableView reloadData];
    });
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
