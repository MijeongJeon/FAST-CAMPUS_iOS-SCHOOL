//
//  DetailViewController.m
//  AlarmClock
//
//  Created by Mijeong Jeon on 6/9/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController () <UITableViewDelegate, UITableViewDataSource>
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatNavigationButton];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self creatTableView];
    [self creatPickerView];
}

// 피커뷰 생성 및 크기 조절
- (void)creatPickerView {
    UIDatePicker *picker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 40, self.view.frame.size.width, self.view.frame.size.height/2)];
    [self.view addSubview:picker];
}

// 테이블 뷰 생성 및 크기 조절
- (void)creatTableView {
    UITableView *detailTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/2, self.view.frame.size.width, self.view.frame.size.height/2) style:UITableViewStyleGrouped];
    detailTableView.delegate = self;
    detailTableView.dataSource = self;
    [self.view addSubview:detailTableView];
}


// 섹션 수
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

// 로우 수
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

// 셀 생성
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    [cell.textLabel setText:@"Detail"];
    
    return cell;
}

// 네비 버튼
- (void)creatNavigationButton {
    self.navigationItem.title = @"Edit Alarm";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(leftButtonAction:)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor redColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:nil action:nil];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor redColor];
}

- (void)leftButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
