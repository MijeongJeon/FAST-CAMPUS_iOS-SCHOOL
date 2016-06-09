//
//  SignUpViewController.m
//  LoginPage
//
//  Created by Mijeong Jeon on 6/2/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "SignUpViewController.h"
#import "DataCenter.h"
#import "MainPageViewController.h"
#import "ViewController.h"

@interface SignUpViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *IdTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIButton *backButton;


@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _IdTextField.delegate = self;
    _IdTextField.tag = 1;
    _passwordTextField.delegate = self;
    _passwordTextField.tag = 2;
    
    [_backButton addTarget:self action:@selector(goBackAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (IBAction)goBackAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

// 엔터 클릭시 다음 칸으로 이동
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField.tag == 1) {
        [_passwordTextField becomeFirstResponder];
    }
    if (textField.tag == 2) {
        [_nextButton becomeFirstResponder];
    }
    return NO;
}

// 가입 완료 버튼(NEXT)
- (IBAction)addUserInfoButton:(id)sender {
    ViewController *loginVC = [[ViewController alloc] init]; ///////// 클래스 새로 생성하기, _ ->self로 변경, 데이터소스 array 생성

    if (_IdTextField.text.length > 0 && _passwordTextField.text.length > 0) { // 모든 필드 기입
        if ([[DataCenter sharedInstance] isCheckLoginwithID:_IdTextField.text]) {
            // 중복 가입
            [loginVC showAlert:@"ID Check" andMessage:@"Use Other ID" andidField:_IdTextField andVC:self];
        } else {
            // 중복 아님
            [[DataCenter sharedInstance] addUserInfoWithID:_IdTextField.text andPassword:_passwordTextField.text];
            [[DataCenter userDefaults] setObject:_IdTextField.text forKey:@"autoId"];
            [[DataCenter userDefaults] setBool:YES forKey:@"autoBool"];
        }
    }
        else {
            [loginVC showAlert:@"Insert Field" andMessage:@"Insert ID and PW" andidField:_IdTextField andVC:self];
        }

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
