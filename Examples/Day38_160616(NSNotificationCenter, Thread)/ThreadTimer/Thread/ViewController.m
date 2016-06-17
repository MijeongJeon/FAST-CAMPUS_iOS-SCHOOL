//
//  ViewController.m
//  Thread
//
//  Created by Mijeong Jeon on 6/16/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSThread *thread;
@property (strong, nonatomic) NSNumber *time;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *goButton;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

// 스레드 액션
- (void)threadAction:(NSThread *)thread {
    NSInteger i = 0;
    
    while (self.thread != nil) {
        i ++;
        self.time = [NSNumber numberWithInteger:i];
        [NSThread sleepForTimeInterval:1];
        [self performSelectorOnMainThread:@selector(updateTime:) withObject:[NSNumber numberWithInteger:i] waitUntilDone:YES];
    }
}

// 스레드에서 발생된 값변화를 메인스레드에 넘겨줌
- (void)updateTime:(NSNumber *)number {
    self.timeLabel.text = [NSString stringWithFormat:@"%@",self.time];
}

// 버튼 눌렸을때 스레드 조절
- (IBAction)goButtonAction:(id)sender {
    // go 버튼일때 스레스 생성, 시작
    if (self.thread == nil) {
        self.thread = [[NSThread alloc] initWithTarget:self selector:@selector(threadAction:) object:nil];
        [self.thread start];
        [self.goButton setTitle:@"RESTART" forState:UIControlStateNormal];
    // stop 버튼일때 스테스 캔슬하고, 비워줌
    } else {
        [self.goButton setTitle:@"GO" forState:UIControlStateNormal];
        [self.thread cancel];
        self.thread = nil;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
