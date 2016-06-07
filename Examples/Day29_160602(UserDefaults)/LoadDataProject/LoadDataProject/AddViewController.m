//
//  AddViewController.m
//  LoadDataProject
//
//  Created by juhyun seo on 6/2/16.
//  Copyright © 2016 WingsCompany. All rights reserved.
//

#import "AddViewController.h"
#import "DataCenter.h"

@interface AddViewController ()

@property (nonatomic, weak) IBOutlet UITextField *nameTextField;
@property (nonatomic, weak) IBOutlet UITextField *phoneTextField;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)okButton:(id)sender {
    [[DataCenter shardInstance] addFriendInfo:self.nameTextField.text phone:self.phoneTextField.text];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
