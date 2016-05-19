//
//  SecondViewController.m
//  Example01
//
//  Created by Mijeong Jeon on 5/17/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "SecondViewController.h"

@implementation SecondViewController
- (void)loadView {
    [super loadView];
    
    NSLog(@"SecondView Controller loadView");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"SecondView Controller viewDidLoad");
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    NSLog(@"SecondView Controller viewWillLayoutSubviews");
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    NSLog(@"SecondView Controller viewDidLayoutSubviews");
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSLog(@"SecondView Controller viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSLog(@"SecondView Controller viewDidAppear");
}


- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    NSLog(@"SecondView Controller viewDidDisappear");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    NSLog(@"SecondView Controller viewWillDisappear");
}

- (IBAction)clickCloseBtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)dealloc {
    NSLog(@"SecondView Controller dealloc");
}

@end
