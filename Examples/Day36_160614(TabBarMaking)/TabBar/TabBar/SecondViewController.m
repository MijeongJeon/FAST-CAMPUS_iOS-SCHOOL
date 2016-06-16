//
//  SecondViewController.m
//  TabBar
//
//  Created by Mijeong Jeon on 6/14/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "SecondViewController.h"
@interface SecondViewController()

@property (strong, nonatomic) UILabel *label;

@end

@implementation SecondViewController

- (void)viewDidLoad {
   
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self createLabel];
    
    // 모달 버튼으로 왔을때만 뒤로가기 버튼 생성
    if ([self isModalButton]) {
        [self goBackButton];
    }
}

// 라벨 생성
- (void)createLabel {
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(20,self.view.center.y, self.view.frame.size.width, 40)];
    [self.view addSubview:self.label];
    [self.label setNumberOfLines:0];
}

// 뷰가 보여질때 문구 반영
- (void)viewDidAppear:(BOOL)animated {
    self.label.text = [self.delegate secondViewLabel];
}

// 뒤로가기 버튼 생성
- (void)goBackButton {
    
        UIButton *goBackButton = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width-120, 40, 100, 40)];
        [goBackButton setTitle:@"Go Back" forState:UIControlStateNormal];
        [goBackButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [self.view addSubview:goBackButton];
        [goBackButton addTarget:self action:@selector(goBackButtonAction:) forControlEvents:UIControlEventTouchUpInside];

}

// 뒤로가기 버튼 액션
- (void)goBackButtonAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
