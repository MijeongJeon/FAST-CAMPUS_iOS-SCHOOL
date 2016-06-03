//
//  ViewController.m
//  UIButton
//
//  Created by Mijeong Jeon on 5/26/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) UILabel *label;
@property (nonatomic, weak) UIButton *button5;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 250, self.view.frame.size.width, 40)];
    _label.textColor = [UIColor blackColor];
    _label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_label];


    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 addTarget:self
               action:@selector(onTouchUpInsideButton:)
     forControlEvents:UIControlEventTouchUpInside];

    button1.tag = 1;
    [button1 setBackgroundImage:[UIImage imageNamed:@"image"] forState:UIControlStateNormal];
    [button1 setTitle:@"1번 버튼" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    [button1 setTitleColor:[UIColor yellowColor] forState:UIControlStateSelected];
    [button1 setFrame:CGRectMake(50, 150, 100, 35)];
    [self.view addSubview:button1];

    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 addTarget:self
               action:@selector(onTouchUpInsideButton:)
     forControlEvents:UIControlEventTouchUpInside];
    button2.tag = 2;
    [button2 setTitle:@"2번 버튼" forState:UIControlStateNormal];
    [button2 setBackgroundImage:[UIImage imageNamed:@"image"] forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    [button2 setTitleColor:[UIColor yellowColor] forState:UIControlStateSelected];
    [button2 setFrame:CGRectMake(250, 150, 100, 35)];
    [self.view addSubview:button2];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button3 addTarget:self
                action:@selector(onTouchUpInsideButton:)
      forControlEvents:UIControlEventTouchUpInside];
    button3.tag = 3;
    [button3 setTitle:@"3번 버튼" forState:UIControlStateNormal];
    [button3 setBackgroundImage:[UIImage imageNamed:@"image"] forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    [button3 setTitleColor:[UIColor yellowColor] forState:UIControlStateSelected];
    [button3 setFrame:CGRectMake(50, 200, 100, 35)];
    [self.view addSubview:button3];
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button4 addTarget:self
                action:@selector(onTouchUpInsideButton:)
      forControlEvents:UIControlEventTouchUpInside];
    button4.tag = 4;
    [button4 setTitle:@"4번 버튼" forState:UIControlStateNormal];
    [button4 setBackgroundImage:[UIImage imageNamed:@"image"] forState:UIControlStateNormal];
    [button4 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button4 setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    [button4 setTitleColor:[UIColor yellowColor] forState:UIControlStateSelected];
    [button4 setFrame:CGRectMake(250, 200, 100, 35)];
    [self.view addSubview:button4];
    
}



- (void)onTouchUpInsideButton:(UIButton *)sender {
    
    if (sender.isSelected) {
        sender.selected = NO;
    } else {
        _button5.selected = NO;
        sender.selected = YES;
        _button5 = sender;
    }
    
    _label.text = [NSString stringWithFormat:@"선택된 번호는 %ld입니다.",sender.tag];

    NSLog(@"touched number %ld", sender.tag);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
