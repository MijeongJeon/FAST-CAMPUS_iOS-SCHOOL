//
//  ForthViewController.m
//  PageMaking
//
//  Created by Mijeong Jeon on 6/13/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "ForthViewController.h"
#import "ThirdViewController.h"
#import "SecondViewController.h"
#import "FirstViewController.h"

@interface ForthViewController ()

@end

@implementation ForthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"Forth"];
    
    // Do any additional setup after loading the view.
}

// 원하는 뷰컨트롤러로 이동하기(클래스 이름 사용)
- (IBAction)goFirstAction:(id)sender {
    FirstViewController *destinationViewController = nil;
    
    for (FirstViewController *VC in self.navigationController.viewControllers) {
        if ([VC isKindOfClass:[FirstViewController class]]) {
            destinationViewController = VC;
        }
    }
    [self.navigationController popToViewController:destinationViewController animated:YES];
}


- (IBAction)goSecondAction:(id)sender {
    SecondViewController *destinationViewController = nil;
    
    for (SecondViewController *viewController in self.navigationController.viewControllers) {
        if ([viewController isKindOfClass:[SecondViewController class]]) {
            destinationViewController = viewController;
        }
    }
    [self.navigationController popToViewController:destinationViewController animated:YES];
}
- (IBAction)goThirdAction:(id)sender {
    ThirdViewController *destinationViewController = nil;
    
    for (ThirdViewController *viewController in self.navigationController.viewControllers) {
        if ([viewController isKindOfClass:[ThirdViewController class]]) {
            destinationViewController = viewController;
        }
    }
    [self.navigationController popToViewController:destinationViewController animated:YES];
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
