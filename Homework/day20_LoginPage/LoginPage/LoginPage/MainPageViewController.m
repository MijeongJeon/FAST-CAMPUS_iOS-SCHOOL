//
//  MainPageViewController.m
//  LoginPage
//
//  Created by Mijeong Jeon on 6/2/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "MainPageViewController.h"

@interface MainPageViewController ()

@end

@implementation MainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [UIView animateWithDuration:10 delay:0.5 options:UIViewAnimationOptionTransitionCurlUp animations:^{
        [_melong setFrame:CGRectMake(20, 20, 50, 30)];} completion:^(BOOL finished){[_melong setFrame:CGRectMake(20, 20, 50, 30)];
        }];

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
