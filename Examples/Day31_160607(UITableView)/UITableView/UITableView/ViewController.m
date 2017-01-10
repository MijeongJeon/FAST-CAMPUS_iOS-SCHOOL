//
//  ViewController.m
//  UITableView
//
//  Created by Mijeong Jeon on 6/7/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController
// tableView 객체생성
- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20,self.view.frame.size.width , self.view.frame.size.height) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

// 섹션 수 설정
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// 로우 수 설정
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

// 헤더 및 푸터 이름 작성
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
    return @"Hello, I'm Section 0";
    } else {
        return @"Hello, I'm Section 1";
    }
}

//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
//    if (section == 0) {
//        return @"Bye";
//    } else {
//        return @"ByeBye";
//    }
//}


// 셀 생성 및 재사용
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    NSString *title = [NSString stringWithFormat:@"section : %ld  row : %ld", indexPath.section, (long)indexPath.row];
    
    if (indexPath.row == indexPath.section) {
            UISwitch *swich = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
            cell.accessoryView = swich;
            cell.textLabel.text = title;
        
    } else {
        cell.textLabel.text = title;
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
