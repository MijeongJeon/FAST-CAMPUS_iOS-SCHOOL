//
//  MainPageViewController.m
//  LoginPage
//
//  Created by Mijeong Jeon on 6/2/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "MainPageViewController.h"
#import "DataCenter.h"
#import "ViewController.h"

@interface MainPageViewController ()

@property(nonatomic)UILabel *welcomeLabel;
@property(nonatomic)UIButton *logOutButton;

@end

@implementation MainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setWelcomeLabel];
    [self setLogOutButton:_logOutButton];
    [self.navigationController setNavigationBarHidden:YES];
}

// welcome 문구
- (void)setWelcomeLabel {
    _welcomeLabel = [[UILabel alloc] init];
    [_welcomeLabel setFrame:CGRectMake(0, self.view.frame.size.height/2-20,self.view.frame.size.width, 40)];
    [_welcomeLabel setTextAlignment:NSTextAlignmentCenter];
    [_welcomeLabel setText:[@"Welcome " stringByAppendingString:[[DataCenter setUserDefaults] objectForKey:@"autoId"]]];
    [_welcomeLabel setTextColor:[UIColor blackColor]];
    [self.view addSubview:_welcomeLabel];
}

// logout button
- (void)setLogOutButton:(UIButton *)logOutButton {
    _logOutButton = [[UIButton alloc] init];
    [_logOutButton setFrame:CGRectMake(0, self.view.frame.size.height-60,self.view.frame.size.width, 40)];
    [_logOutButton setTitle:@"Logout" forState:UIControlStateNormal];
    [_logOutButton setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:_logOutButton];
    [_logOutButton addTarget:self action:@selector(logOutAction:) forControlEvents:UIControlEventTouchUpInside];
}
 
- (void)logOutAction:(id)sender {
    [[DataCenter setUserDefaults] removeObjectForKey:@"autoId"];
    [[DataCenter setUserDefaults] removeObjectForKey:@"autoBool"];
    [self.navigationController popToRootViewControllerAnimated:YES];

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
