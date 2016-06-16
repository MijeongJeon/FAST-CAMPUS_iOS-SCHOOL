//
//  ThirdViewController.m
//  TableViewMaking
//
//  Created by Mijeong Jeon on 6/16/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UIButton  *backButton;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self createLabel];
    [self createButton];
    
    // Do any additional setup after loading the view.
}

- (void)createLabel {
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(10, 40, self.view.frame.size.width, 40)];
    [self.label setBackgroundColor:[UIColor whiteColor]];
    [self.label setTextColor:[UIColor blackColor]];
    [self.view addSubview:self.label];
    self.label.text = self.secondText;
}

- (void)createButton {
    self.backButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 100, 100, 40)];
    [self.backButton addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.backButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.backButton setTitle:@"Go Back" forState:UIControlStateNormal];
    [self.view addSubview:self.backButton];
}

- (void)backAction:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
