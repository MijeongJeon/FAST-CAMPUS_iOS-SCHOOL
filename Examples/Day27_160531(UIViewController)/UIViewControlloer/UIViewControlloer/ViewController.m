//
//  ViewController.m
//  UIViewControlloer
//
//  Created by Mijeong Jeon on 5/31/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "ViewController.h"
#import "ThirdViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)nNextButton:(UIButton *)sender {
    
    ThirdViewController *thirdView = [[ThirdViewController alloc] init];
    [self.navigationController pushViewController:thirdView animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
