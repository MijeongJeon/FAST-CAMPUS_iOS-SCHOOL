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
    _idField.delegate = self;
    _idField.tag = 1;
    _passwordField.delegate = self;
    _passwordField.tag = 2;
    [self displayMemberInfo];
    [self.navigationController setNavigationBarHidden:YES];

}


// 메인화면으로 이동하는 세그
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if ([identifier isEqualToString:@"LoginToMain"]) {
        if ([self isCheckLoginwithID:_idField.text userPW:_passwordField.text]) {
            [[DataCenter setUserDefaults] setObject:_idField.text forKey:@"autoId"];
            [[DataCenter setUserDefaults] setBool:NO forKey:@"autoBool"];
            return YES;
        } else {
            return NO;
        }
    } else {
        return YES;
    }
}


// ID입력후 엔터 누르면 다음칸으로 이동, PW입력후 엔터 누르면 버튼 클릭
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField.tag ==1 && _idField.text.length > 0) {
        [_passwordField becomeFirstResponder];
        return YES;
    }
    if (textField.tag == 2 && _passwordField.text.length > 0) {
        if ([self shouldPerformSegueWithIdentifier:@"LoginToMain" sender:_buttonLogin]) {
            [self performSegueWithIdentifier:@"LoinToMain" sender:self];
        }
        
    }
    return YES;
}


// ID와 Password가 가입되어있는 정보인지 확인하는 메소드
- (BOOL)isCheckLoginwithID:(NSString *)userID userPW:(NSString *)userPW {
    
    NSArray *infoArray = [NSArray arrayWithContentsOfFile:[[DataCenter sharedInstance] findUserInfoPath]];
    for (NSDictionary *infoDic in infoArray) {
        NSString *insertedID = [infoDic objectForKey:@"id"];
        NSString *insertedPW = [infoDic objectForKey:@"password"];
        if ([insertedID isEqualToString:userID] && [insertedPW isEqualToString:userPW]) {
            return YES;
        }
    }
    return NO;
}

//  가입 id 화면에 표시
- (void)displayMemberInfo {
    NSArray *infoArray = [NSArray arrayWithContentsOfFile:[[DataCenter sharedInstance] findUserInfoPath]];
    for (NSDictionary *infoDic in infoArray) {
        NSLog(@"%@",[infoDic objectForKey:@"id"]);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
