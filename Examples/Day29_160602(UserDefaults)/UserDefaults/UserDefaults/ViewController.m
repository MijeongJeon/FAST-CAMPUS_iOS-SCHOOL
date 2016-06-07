//
//  ViewController.m
//  UserDefaults
//
//  Created by Mijeong Jeon on 6/2/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "ViewController.h"
#import "DataCenter.h"

@interface ViewController ()

@property (nonatomic, weak)IBOutlet UITextField *nameTextField;
@property (nonatomic, weak)IBOutlet UIButton *nextButton;
@property (nonatomic, weak)IBOutlet UIButton *checkButton;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated {
    NSLog(@"-----------VIEW WILL APPER---------\n");

    [[DataCenter sharedInstance] printData];
}

- (IBAction)checkButtonAction:(UIButton *)sender {
    NSLog(@"-----------VIEW CONTROLL ACTION--------\n");
    [[DataCenter sharedInstance] setName:self.nameTextField.text];
    [[DataCenter sharedInstance] printData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
