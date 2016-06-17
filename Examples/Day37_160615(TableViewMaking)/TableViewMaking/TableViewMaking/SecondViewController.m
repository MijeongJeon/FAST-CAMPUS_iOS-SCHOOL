//
//  SecondViewController.m
//  TableViewMaking
//
//  Created by Mijeong Jeon on 6/15/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "SecondViewController.h"
#import "DataCenter.h"
#import "ThirdViewController.h"

@interface SecondViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) DataCenter *dataCenter;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    self.dataCenter = [DataCenter defaultData];
    self.navigationItem.title = [NSString stringWithFormat:@"%@", self.type];    

}

//***************************************************************************************//

                                        // 테이블 //

//***************************************************************************************//


// 섹션수
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// 로우수
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[self.dataCenter allDetailData] objectForKey:self.type] count];
}

// 셀 생성
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"detailCell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"detailCell"];
    }
    cell.textLabel.text = [[self.dataCenter allDetailData] objectForKey:self.type][indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:20];
    return cell;
}

// 셀 높이
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ThirdViewController *thirdVC = [[ThirdViewController alloc] init];
    thirdVC.secondText = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
    [self presentViewController:thirdVC animated:YES completion:nil];
    
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
