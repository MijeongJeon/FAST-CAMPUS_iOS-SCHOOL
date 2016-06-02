//
//  ViewController.m
//  LoginPage
//
//  Created by Mijeong Jeon on 5/23/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageGoogle;
@property (nonatomic, weak) IBOutlet UIImageView *imageUser;
@property (nonatomic, weak) IBOutlet UIButton *buttonLogin;
@property (nonatomic) UIView *reset;
@property (nonatomic, weak) IBOutlet UIView *view1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_buttonLogin addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)action:(UIButton *)sender {
    // user 이미지의 초기 위치를 저장하는 값 생성 및 저장
    _reset = [[UIView alloc] init];
    _reset.alpha = 0.0;
    [_view1 addSubview:_reset];
    [_reset setFrame: CGRectMake(_imageUser.frame.origin.x,_imageUser.frame.origin.y, _imageUser.frame.size.width, _imageUser.frame.size.height)];
    
    [UIImageView animateWithDuration:2 delay:0.5 usingSpringWithDamping:50 initialSpringVelocity:50 options:UIViewAnimationOptionCurveEaseInOut animations:^{[_imageUser setCenter:CGPointMake(0, 0)];} completion:^(BOOL Finished){
        [_imageUser setCenter:CGPointMake(_reset.center.x, _reset.center.y)];}];
    // 애니메이션 이후 제자리로 돌아옴
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
