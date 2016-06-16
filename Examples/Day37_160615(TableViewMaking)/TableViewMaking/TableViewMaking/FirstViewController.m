//
//  FirstViewController.m
//  TableViewMaking
//
//  Created by Mijeong Jeon on 6/15/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "FirstViewController.h"
#import "DataCenter.h"
#import "SecondViewController.h"

@interface FirstViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) DataCenter *dataCenter;
@property (strong, nonatomic) UITableViewCell *cell;
@property (strong, nonatomic) UISwitch *switchForSection;
@property (strong, nonatomic) SecondViewController *secondVC;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    // 테이블 뷰 생성
    [self creatTableView];
    
    // 데이터센터 객체생성
    self.dataCenter = [DataCenter defaultData];
    
    // 네비 타이틀
    self.navigationItem.title = @"Table";

}

//***************************************************************************************//

                                        // 테이블 //

//***************************************************************************************//


// 테이블 생성
- (void)creatTableView {
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
}

// 섹션 수
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return [[self.dataCenter allData] count];
}

// 로우 수
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[self.dataCenter allData] objectForKey:[self.dataCenter dataDicTitle][section]] count];
}


// 셀 생성 및 속성
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    self.cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (self.cell == nil) {
        self.cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    if (indexPath.section == 0) {
        self.cell.backgroundColor = [UIColor blackColor];
        self.cell.textLabel.textColor = [UIColor whiteColor];
        self.cell.textLabel.font = [UIFont boldSystemFontOfSize:20];
        [self.cell setAccessoryType:UITableViewCellAccessoryDetailButton];
    
//        if (indexPath.row == 0) {
//            [self.cell.imageView setImage:[UIImage imageNamed:self.data];
//        } else {
//            [self.cell.imageView setImage:[UIImage imageNamed:@"web"]];
//            
//        }
    } else {
        self.cell.backgroundColor = [UIColor whiteColor];
        self.cell.textLabel.textColor = [UIColor blackColor];
        self.switchForSection = [[UISwitch alloc] init];
        self.cell.textLabel.font = [UIFont italicSystemFontOfSize:20];
        [self.cell setAccessoryView:self.switchForSection];
//        if (indexPath.row == 0) {
//            [self.cell.imageView setImage:[UIImage imageNamed:@"sun.jpg"]];
//        } else {
//            [self.cell.imageView setImage:[UIImage imageNamed:@"moon.jpg"]];
//        }
    }
    
    [self.cell.imageView setImage:[UIImage imageNamed:[[self.dataCenter allData] objectForKey:[self.dataCenter dataDicTitle][indexPath.section]][indexPath.row]]];
    self.cell.textLabel.text = [[self.dataCenter allData] objectForKey:[self.dataCenter dataDicTitle][indexPath.section]][indexPath.row];

    return self.cell;
}

// 섹션 타이틀
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    return [self.dataCenter dataDicTitle][section];
}

// 로우 높이 조절
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 80;
    } else {
        return 80;
    }
}

// 셀 선택 후 자동해제
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    self.secondVC = [[SecondViewController alloc] init];
    self.secondVC.type = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;

    [self.navigationController pushViewController:self.secondVC animated:YES];

//    secondVC.delegate = self;
//    if (indexPath.section == 0 && indexPath.row == 0) {
//        secondVC.type = @"ios";
//    } else if (indexPath.section == 0 && indexPath.row == 1) {
//        secondVC.type = @"web";
//    } else if (indexPath.section == 1 && indexPath.row == 0) {
//        secondVC.type = @"world";
//    }else {
//        secondVC.type = @"korea";
//    }
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
