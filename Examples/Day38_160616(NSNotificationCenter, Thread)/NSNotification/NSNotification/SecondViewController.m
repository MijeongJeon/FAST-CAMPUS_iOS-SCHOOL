//
//  SecondViewController.m
//  NSNotification
//
//  Created by Mijeong Jeon on 6/16/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "SecondViewController.h"
#import "ViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UITextField *secondTextField;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Second";
    // 시스템 노티(키보드 올라갈때 노티 받음)
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardUp:) name:UIKeyboardWillShowNotification object:nil];
    
    // 같은 이름으로 받으면 같은 셀렉트메소드 실행됨
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardUp:) name:UIKeyboardWillShowNotification object:nil];

    // Do any additional setup after loading the view.
}

// 화면 dealloc시 리무브 시킴(굳이 안해줘도 되는것 같음)
//- (void)dealloc {
//    NSLog(@"dealloc");
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
//}

// 오케이 버튼 눌렀을때 액션
- (IBAction)okAction:(id)sender {
    // 노티를 포스트해줌
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NotifiTestKey"
                                                        object:self.secondTextField.text];
    // 첫번째 화면의 옵저버를 제거해줌(업데이트 방지)
    ViewController *firstVC = self.navigationController.viewControllers[0];
    [[NSNotificationCenter defaultCenter] removeObserver:firstVC
                                                    name:@"NotifiTestKey"
                                                  object:nil];
   
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)keyboardUp:(NSNotification *)noti {
    NSLog(@"keyboardUP");
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
