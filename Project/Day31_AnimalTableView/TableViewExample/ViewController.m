//
//  ViewController.m
//  TableViewExample
//
//  Created by youngmin joo on 2016. 6. 6..
//  Copyright © 2016년 WingsCompany. All rights reserved.
//

#import "ViewController.h"
#import "DataCenter.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController

// tableView 생성
- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *animalTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    animalTable.delegate = self;
    animalTable.dataSource = self;
    [self.view addSubview:animalTable];
    
    
}

// Section 수
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    NSLog(@"%zd",[[DataCenter defaultData] sectionCount]);
    return [[DataCenter defaultData] sectionCount];
}

// Section 당 row 수
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *animalKeyArray = [[DataCenter defaultData] sectionTitles];
    NSArray *animalArray = [[DataCenter defaultData].allAnimals objectForKey:animalKeyArray[section]];
    
    return animalArray.count;
}


// Section HeaderTitle
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [[DataCenter defaultData] sectionTitles][section];;
}

// cell 생성 및 속성 입력
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    NSArray *animalKeyArray = [[DataCenter defaultData] sectionTitles];
    
    NSArray *animalArray = [[DataCenter defaultData].allAnimals objectForKey:animalKeyArray[indexPath.section]];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", animalArray[indexPath.row]]; // 동물이름 입력
    [cell.imageView setImage:[UIImage imageNamed:[[DataCenter defaultData]imageNameWithAnimal:animalArray[indexPath.row]]]]; // 이미지 입력
    
    return cell;
}

// index list 출력
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    
    return [[DataCenter defaultData] sectionTitles];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
