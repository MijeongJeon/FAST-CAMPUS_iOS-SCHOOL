//
//  SecondViewController.m
//  UserDefaults
//
//  Created by Mijeong Jeon on 6/2/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "SecondViewController.h"
#import "DataCenter.h"

@interface SecondViewController ()

@property (nonatomic, weak)IBOutlet UITextField *ageTextField;
@property (nonatomic, weak)IBOutlet UIButton *checkButton;


@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)checkButtonAction:(UIButton *)sender {
    NSLog(@"-----------VIEW CONTROLL ACTION---------\n");
    [[DataCenter sharedInstance] setAge:self.ageTextField.text.integerValue];
    [[DataCenter sharedInstance] printData];
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
