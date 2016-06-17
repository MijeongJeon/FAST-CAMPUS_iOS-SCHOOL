//
//  ViewController.m
//  NSNotification
//
//  Created by Mijeong Jeon on 6/16/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *firstLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addNotification];
    self.navigationItem.title = @"First";
    // Do any additional setup after loading the view, typically from a nib.
}

// 노티 옵저버 등록
- (void)addNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(trackAction:)
                                                 name:@"NotifiTestKey"
                                               object:nil];
}

// 노티가 왔을때 액션
- (void)trackAction:(NSNotification *)noti {
    self.firstLabel.text = noti.object;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
