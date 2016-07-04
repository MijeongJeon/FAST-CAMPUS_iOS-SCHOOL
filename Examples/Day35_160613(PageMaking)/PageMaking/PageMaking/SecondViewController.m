//
//  SecondViewController.m
//  PageMaking
//
//  Created by Mijeong Jeon on 6/13/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UILabel *secondPageLabel;
@property (strong, nonnull) NSString *labelString;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.secondPageLabel.text = self.labelString;
    [self.navigationItem setTitle:@"Second"];
    // Do any additional setup after loading the view.
}

// Step4. 다음페이지에 문구 넘기기(Delegate)
- (IBAction)toNextButtonAction:(id)sender {
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ThirdViewController *third = [mainStoryBoard instantiateViewControllerWithIdentifier:@"third"];
    third.delegate = self;
    [self.navigationController pushViewController:third animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setLabelText:(NSString *)string{
    self.labelString = string;
}

// delegate method
- (NSString *)setLabel {
    return self.labelString;
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
