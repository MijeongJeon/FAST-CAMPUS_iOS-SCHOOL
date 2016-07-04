//
//  ThirdViewController.m
//  PageMaking
//
//  Created by Mijeong Jeon on 6/13/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()
@property (weak, nonatomic) IBOutlet UILabel *thirdLabel;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"Third"];
    
    self.thirdLabel.text = [self.delegate setLabel];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)goBackButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)goFirstButton:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
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
