//
//  ThirdViewController.m
//  Example01
//
//  Created by Mijeong Jeon on 5/17/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "ThirdViewController.h"

@implementation ThirdViewController

- (void)loadView {
    [super loadView];
    
    NSLog(@"ThirdView Controller loadView");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"ThirdView Controller viewDidLoad");
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    NSLog(@"ThirdView Controller viewWillLayoutSubviews");
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    NSLog(@"ThirdView Controller viewDidLayoutSubviews");
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSLog(@"ThirdView Controller viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSLog(@"ThirdView Controller viewDidAppear");
}


- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    NSLog(@"ThirdView Controller viewDidDisappear");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    NSLog(@"ThirdView Controller viewWillDisappear");
}

- (IBAction)clickCloseBtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)dealloc {
    NSLog(@"ThirdView Controller dealloc");
}

@end
