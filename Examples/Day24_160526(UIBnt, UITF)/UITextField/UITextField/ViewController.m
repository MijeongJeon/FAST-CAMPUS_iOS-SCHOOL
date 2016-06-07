//
//  ViewController.m
//  UITextField
//
//  Created by Mijeong Jeon on 5/26/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<UITextFieldDelegate>
@property (nonatomic)UITextField *textField;
@property (nonatomic)UILabel *textLabel;
@property (nonatomic)UIButton *textButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 텍스트 필드 개체 선언 및 속성 부여
    _textField = [[UITextField alloc] initWithFrame: CGRectMake(60, 100, 200, 40)];
    _textField.placeholder = @"텍스트 입력";
    _textField.borderStyle = UITextBorderStyleBezel;
    _textField.delegate = self;
    [self.view addSubview:_textField];
    
    // 버튼 개체 선언 및 속성 부여
    _textButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_textButton setFrame:CGRectMake(270, 100, 60, 40)];
    [_textButton setTitle:@"확인" forState:UIControlStateNormal];
    [_textButton addTarget:self action:@selector(onTouchUpInside) forControlEvents:UIControlEventTouchUpInside];
    [_textButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_textButton setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    [_textButton setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:_textButton];
    
    // 레이블 개체 선언 및 속성 부여
    _textLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 150, 200, 40)];
    [self.view addSubview:_textLabel];
    [_textLabel setText:@"결과 : "];
    
}
    // 터치 액션 설정(인스턴스 메소드 사용)
- (void)onTouchUpInside {
    [self textFieldShouldReturn:_textField];
//    [_textLabel setText:[NSString stringWithFormat:@"결과 : %@",_textField.text]];
//    [_textField resignFirstResponder];
}


-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    NSLog(@"call textFiedlShouldEditing");
    
    return YES;
}
    // 리턴할때 동작 설정
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [_textLabel setText:[NSString stringWithFormat:@"결과 : %@",_textField.text]];
    [textField resignFirstResponder];
    NSLog(@"call textFiedlShouldReturn");
    
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"call textFiedlDidBeginEditing");
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"call textFiedlDidEndEditing");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
