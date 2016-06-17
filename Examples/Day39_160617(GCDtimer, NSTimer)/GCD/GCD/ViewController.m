//
//  ViewController.m
//  GCD
//
//  Created by Mijeong Jeon on 6/17/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

// gcd property
@property (nonatomic) dispatch_queue_t timer_queue;
@property (nonatomic) NSInteger gcdSecond;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.gcdSecond = 0;
}

- (IBAction)buttonAction:(UIButton *)sender {
    if (sender.selected) {
        sender.selected = NO;
        
        [self stop];
    } else {
        sender.selected = YES;
        if (self.timer_queue == nil) {
            self.timer_queue = dispatch_queue_create("wing", DISPATCH_QUEUE_SERIAL);
            
            [self startTime];
        } else {
            dispatch_resume(self.timer_queue);
        }
    }
}

#pragma mark - GCD Method

- (void)stop {
    dispatch_sync(self.timer_queue, ^{
        dispatch_suspend(self.timer_queue);
    });
}

- (void)startTime {
    
    dispatch_async(self.timer_queue, ^{
        self.gcdSecond ++;
    
    dispatch_sync(dispatch_get_main_queue(), ^{
        self.timeLabel.text = [NSString stringWithFormat:@"%ld",self.gcdSecond];
    });
    
    dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC);
    dispatch_after(delay, self.timer_queue, ^ {
        [self startTime];
    });
        });
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
