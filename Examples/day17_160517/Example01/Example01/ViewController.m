//
//  ViewController.m
//  Example01
//
//  Created by Mijeong Jeon on 5/17/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "ViewController.h"
#import "MyTestClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)loadView {
    [super loadView];
    
    NSLog(@"FirstView Controller loadView");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"FirstView Controller viewDidLoad");
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    NSLog(@"FirstView Controller viewWillLayoutSubviews");
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    NSLog(@"FirstView Controller viewDidLayoutSubviews");
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSLog(@"FirstView Controller viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSLog(@"FirstView Controller viewDidAppear");
}


- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    NSLog(@"FirstView Controller viewDidDisappear");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    NSLog(@"FirstView Controller viewWillDisappear");
}

- (void)dealloc {
    NSLog(@"FirstView Controller dealloc");
}
//- (IBAction)clickCloseBtn:(id)sender {
//    [self dismissViewControllerAnimated:YES completion:nil];

//}

    // Do any additional setup after loading the view, typically from a nib.
    
    /*
     [super viewDidLoad];

    MyTestClass *testObject = [[MyTestClass alloc] init];
    // viewDidLoad 메소드가 끝나는 시점에 testObject가 메모리에서 해제됨

    NSLog(@"Break!!");

    NSLog(@"viewDidLoad will finish");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
     */

@end
