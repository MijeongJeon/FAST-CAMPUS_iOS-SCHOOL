//
//  ViewController.m
//  NSTimer
//
//  Created by Mijeong Jeon on 6/16/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) CGFloat sec;
@property (nonatomic) NSInteger min;
@property (strong, nonatomic) NSTimer *timer;
@property (weak, nonatomic) IBOutlet UILabel *secLabel;
@property (weak, nonatomic) IBOutlet UIButton *goButton;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *labButton;
@property (strong, nonatomic) NSMutableArray *timeArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.timeArray = [[NSMutableArray alloc] initWithCapacity:1];
    
    // Do any additional setup after loading the view, typically from a nib.
}


//*******************************************************************************//

// 타이머 //

//*******************************************************************************//

#pragma mark - Timer Method

// 타이머 시작 액션
- (void)startTimer:(NSTimer *)sender {
    // time intercal(0.01초 받아오기)
    self.sec = self.sec + sender.timeInterval;
    
    // 60초 넘으면 분으로 넘겨주기
    if (self.sec > 60.00) {
        self.sec = 0.0f;
        self.min ++;
    }
    
    // 초, 분 두자리로 맞춰주기
    if (self.min < 10 && self.sec < 10 ) {
        self.secLabel.text = [NSString stringWithFormat:@"0%ld:0%.2f", self.min, self.sec];
    } else if (self.min < 10 && self.sec > 10 ) {
        self.secLabel.text = [NSString stringWithFormat:@"0%ld:%.2f", self.min, self.sec];
    } else if (self.min > 10 && self.sec < 10 ) {
        self.secLabel.text = [NSString stringWithFormat:@"%ld:0%.2f", self.min, self.sec];
    } else {
        self.secLabel.text = [NSString stringWithFormat:@"%ld:%.2f",self.min, self.sec];
    }
}


#pragma mark - Button Action Method
// 고 버튼 액션
- (IBAction)goAction:(id)sender {
    // 타이머가 비활성화 되어있으면 시작시켜줌
    if (self.timer.isValid == NO) {
        //        self.timer = [[NSTimer alloc] initWithFireDate:[NSDate date]
        //                                              interval:0.01 target:self
        //                                              selector:@selector(startTimer:)
        //                                              userInfo:nil
        //                                               repeats:YES];
        //
        //        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01
                                                      target:self selector:@selector(startTimer:)
                                                    userInfo:nil
                                                     repeats:YES ];
        
        
        [self.goButton setTitle:@"STOP" forState:UIControlStateNormal];
        [self.labButton setTitle:@"LAP" forState:UIControlStateNormal];
        
        // 다시 클릭했을때 타이머 비활성화 시켜줌
    } else {
        [self.timer invalidate];
        [self.goButton setTitle:@"GO" forState:UIControlStateNormal];
        [self.labButton setTitle:@"RESET" forState:UIControlStateNormal];
    }
}


// 랩 버튼 액션
- (IBAction)lapAction:(id)sender {
    // 타이머 활성시 테이블 로우 1추가 + 현재 시각 입력
    if (self.timer.isValid == YES) {
        
        NSIndexPath *path = [NSIndexPath indexPathForRow:self.timeArray.count inSection:0];
        NSString *time = [NSString stringWithFormat:@"%ld:%.2f",self.min,self.sec];
        [self.timeArray addObject:time];
        [self.tableView insertRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationFade];
    } else {
        self.sec = 0.0f;
        self.min = 0;
        self.secLabel.text = @"00:00.00";
        [self.timeArray removeAllObjects];
        [self.tableView reloadData];
    }
    
}

//*******************************************************************************//

// 테이블 //

//*******************************************************************************//

#pragma mark - UITableViewDelegate


// 섹션 수
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// 로우 수
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.timeArray count];
}

// 셀 생성
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    //    if (cell == nil) {
    //        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    //    } (스토리보드에서 cell 생성)
    
    cell.textLabel.text = self.timeArray[indexPath.row];
    return cell;
}

// 셀 수정 가능여부 설정
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
