//
//  GCDtest.m
//  GCD
//
//  Created by Mijeong Jeon on 6/17/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "GCDtest.h"

@interface GCDtest ()

@end

@implementation GCDtest

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // global queue 생성
    dispatch_queue_t testQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    // gueue 실행
    
    // main queue에서 async test(순차적 실행)
    dispatch_async(dispatch_get_main_queue(), ^{ NSLog(@"Call 1");});
    
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC));
    dispatch_time_t time2 = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC));
    
    dispatch_async(dispatch_get_main_queue(), ^{
        for (NSInteger i = 0; i < 5000; i++) {
            NSLog(@"%ld",i); }
    } );
    
    dispatch_async(dispatch_get_main_queue(), ^{ NSLog(@"Call 3");});
    
    dispatch_async(dispatch_get_main_queue(), ^{ NSLog(@"Call 4");});
    
    dispatch_async(dispatch_get_main_queue(), ^{ NSLog(@"Call 5");});
    
    dispatch_after(time2, testQueue, ^{ NSLog(@"delay 2s");});
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
