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
    [UIView animateWithDuration:20 delay:0.5 options:UIViewAnimationOptionTransitionFlipFromTop animations:^{
        [_melong setFrame:CGRectMake(10, 0, self.view.frame.size.width/2, self.view.frame.size.height/2)];} completion:^(BOOL finished){[_melong setFrame:CGRectMake(10, self.view.frame.size.height, self.view.frame.size.width/30, self.view.frame.size.height/10)];
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
