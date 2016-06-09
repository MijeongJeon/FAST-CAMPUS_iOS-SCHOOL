//
//  ViewController.m
//  LoginPage
//
//  Created by Mijeong Jeon on 5/23/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "ViewController.h"
#import "DataCenter.h"
#import "MainPageViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageGoogle;
@property (nonatomic, weak) IBOutlet UIImageView *imageUser;
@property (nonatomic, weak) IBOutlet UIButton *buttonLogin;
@property (nonatomic, weak) IBOutlet UIView *view1;
@property (nonatomic, weak) IBOutlet UITextField *idField;
@property (nonatomic, weak) IBOutlet UITextField *passwordField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.idField.delegate = self;
    self.idField.tag = 1;
    self.passwordField.delegate = self;
    self.passwordField.tag = 2;
    
    if (!([[DataCenter userDefaults] objectForKey:@"autoId"] == nil)) {
    self.idField.text = [[DataCenter userDefaults] objectForKey:@"autoId"];
    }
    [self displayMemberInfo];
    [self.navigationController setNavigationBarHidden:YES];
}

// 메인화면으로 이동하는 세그
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    
    if ([identifier isEqualToString:@"LoginToMain"]) {
        if (self.idField.text.length > 0 && self.passwordField.text.length > 0) {
            if ([[DataCenter sharedInstance] isCheckLoginwithID:self.idField.text userPW:self.passwordField.text]) {
                [[DataCenter userDefaults] setObject:self.idField.text forKey:@"autoId"];
                [[DataCenter userDefaults] setBool:YES forKey:@"autoBool"];
                return YES;
            } else {
                [self showAlert:@"Login Fail" andMessage:@"Invalid User Information" andidField:self.idField andVC:self];
                return NO;
            }
        } else {
            [self showAlert:@"Insert Field" andMessage:@"Insert ID and PW" andidField:self.idField andVC:self];
        }
    } else {
    }
        return YES;
}

// ID입력후 엔터 누르면 다음칸으로 이동, PW입력후 엔터 누르면 버튼 클릭
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField.tag ==1) {
        [self.passwordField becomeFirstResponder];
        return YES;
    }
    if (textField.tag == 2) {
        if ([self shouldPerformSegueWithIdentifier:@"LoginToMain" sender:self]) {
            [self performSegueWithIdentifier:@"LoginToMain" sender:self];
        }
    }
    return YES;
}

// 알림 표시

- (void)showAlert:(NSString *)failTitle andMessage:(NSString *)failMessage andidField:(UITextField *)idField  andVC:(UIViewController *)VC{
    
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:failTitle
                                          message:failMessage
                                          preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *tryAgainction = [UIAlertAction actionWithTitle:@"Try Again"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * _Nonnull action){
                                                              [idField becomeFirstResponder];
                                                          }];
    [alertController addAction:tryAgainction];
    [VC presentViewController:alertController animated:YES completion:nil];
}


//  가입 id 화면에 표시
- (void)displayMemberInfo {
    NSArray *infoArray = [NSArray arrayWithContentsOfFile:[[DataCenter sharedInstance] findUserInfoPath]];
    for (NSDictionary *infoDic in infoArray) {
        NSLog(@"registered id : %@",[infoDic objectForKey:@"id"]);
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
