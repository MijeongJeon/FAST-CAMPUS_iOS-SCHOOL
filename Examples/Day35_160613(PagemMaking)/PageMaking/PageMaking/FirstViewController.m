//
//  ViewController.m
//  PageMaking
//
//  Created by Mijeong Jeon on 6/13/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()
<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textField.delegate = self;
    [self.navigationItem setTitle:@"First"];
    // Do any additional setup after loading the view, typically from a nib.
}

// step1. 버튼 클릭시 화면에 문구 표시, 키보드 내려가기
- (IBAction)textToLabelAction:(id)sender {
    
    self.label.text = self.textField.text;
    [self.textField endEditing:YES];
}

// step2. 엔터 클릭시 문구표시, 키보드 내려가기
- (BOOL)textFieldShouldReturn:(UITextField *)textField {

    self.label.text = self.textField.text;
    [self.textField endEditing:YES];

    return NO;
}

// step3. 탭시 키보드 내려가기
- (IBAction)tapGestuer:(id)sender {
    [self.textField endEditing:YES];
}

// step4. 다음화면으로 넘어갈때 문구 넘기기(prepareForSegue)
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"ToNextPage"]) {

        SecondViewController *secondView = [segue destinationViewController];
        [secondView setLabelText:self.label.text];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
