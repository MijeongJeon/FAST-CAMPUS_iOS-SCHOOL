//
//  FirstViewController.m
//  TabBar
//
//  Created by Mijeong Jeon on 6/14/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "FirstViewController.h" 
#import "SecondViewController.h"

@interface FirstViewController()
<UITextViewDelegate, UIGestureRecognizerDelegate, SecondViewLabelDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UITextView *textView;
@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UIButton *naviButton;
@property (strong, nonatomic) UIButton *modalButton;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.navigationItem.title = @"Home";

    [self creatLabel];
    [self creatTextView];
//    [self createGesture];
    [self creatNaviButton];
    [self creatModalButton];
    
    // 두번째 화면 객체 생성 및 델리게이트 연결
    SecondViewController *secondVC = [self.tabBarController.viewControllers objectAtIndex:1];
    secondVC.delegate = self;
}

// 텍스트 뷰 생성
- (void)creatTextView {
    
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width/2, self.view.frame.size.height)];
    [self.textView setBackgroundColor:[UIColor blackColor]];
    [self.textView setTextColor:[UIColor whiteColor]];
    [self.textView setFont:[UIFont systemFontOfSize:20]];
    self.textView.delegate = self;
    
    [self.view addSubview:self.textView];
}

// 라벨 생성
- (void)creatLabel{
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2, 64, self.view.frame.size.width/2, self.view.frame.size.height)];
    
    [self.label setBackgroundColor:[UIColor whiteColor]];
    [self.label setTextColor:[UIColor blackColor]];
    [self.label setNumberOfLines:0];
    [self.view addSubview:self.label];

}

// 네비 버튼 생성
- (void)creatNaviButton {
    self.naviButton = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width-100, 64, 100, 40)];
    [self.view addSubview:self.naviButton];
    [self.naviButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.naviButton setTitle:@"NAVI" forState:UIControlStateNormal];
    [self.naviButton addTarget:self action:@selector(naviButton:) forControlEvents:UIControlEventTouchUpInside];
}

// 네비 버튼 액션
- (void)naviButton:(id)sender {

    SecondViewController *seondVC =  [[SecondViewController alloc] init];
    seondVC.delegate = self;
    [self.navigationController pushViewController:seondVC animated:YES];
}

// 모달 버튼 생성
- (void)creatModalButton {
    self.modalButton = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width-100, 124, 100, 40)];
    [self.view addSubview:self.modalButton];
    [self.modalButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.modalButton setTitle:@"MODAL" forState:UIControlStateNormal];
    [self.modalButton addTarget:self action:@selector(modalButton:) forControlEvents:UIControlEventTouchUpInside];
}

// 모달 버튼 액션
- (void)modalButton:(id)sender {
    
    SecondViewController *secondVC =  [[SecondViewController alloc] init];
    secondVC.delegate = self;
    secondVC.isModalButton = YES;

    [self presentViewController:secondVC animated:YES completion:nil];
}

// 텍스트뷰의 텍스트가 변화는걸 실시간으로 감지
- (void)textViewDidChange:(UITextView *)textView {
    self.label.text = textView.text;
}

// 텍스트뷰 에딧팅 될때
- (void)textViewDidBeginEditing:(UITextView *)textView {
    NSLog(@"Begin Edit");
}

// 텍스트뷰 에딧팅 끝날때
- (void)textViewDidEndEditing:(UITextView *)textView {
    NSLog(@"End Edit");
}

// 탭제스처 생성
- (void)createGesture{
//    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] init];
//    tapGesture.delegate = self;
//    [self.view addGestureRecognizer:tapGesture];
}


// touch 액션 지정
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.textView.isEditable) {
        self.textView.editable = NO;
    } else {
        self.textView.editable = YES;
    }

}

// 델리게이트 메소드 구현
- (NSString *)secondViewLabel {
    return self.label.text;
}

@end
