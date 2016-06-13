//
//  ViewController.m
//  Alert
//
//  Created by Mijeong Jeon on 6/10/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *alertButtom;
@property (weak, nonatomic) IBOutlet UIButton *alertSheetButton;
@property (weak, nonatomic) IBOutlet UILabel *travelLabel;
@property (weak, nonatomic) IBOutlet UILabel *companyLabel;


@end

@implementation ViewController

// alert style
- (IBAction)alertAction:(id)sender {

    

// alert 객체 생성
    UIAlertController *travelAlert = [UIAlertController alertControllerWithTitle:@"TRAVEL"
                                                                   message:@"Where Do You Want To GO?"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    
// alert action(actionStyle에서 default, destructive는 여러개, cancel 한개씩 사용 가능)
    UIAlertAction *italy = [UIAlertAction actionWithTitle:@"Italy"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             [self.travelLabel setText:@"Italy"];
                                                         }];
    UIAlertAction *russia = [UIAlertAction actionWithTitle:@"Russia"
                                                    style:UIAlertActionStyleDefault
                                                  handler:^(UIAlertAction * _Nonnull action) {
                                                      [self.travelLabel setText:@"Russia"];
                                                  }];

    UIAlertAction *egypt = [UIAlertAction actionWithTitle:@"Egypt"
                                                    style:UIAlertActionStyleDefault
                                                  handler:^(UIAlertAction * _Nonnull action) {
                                                      [self.travelLabel setText:@"Egypt"];
                                                  }];
    UIAlertAction *noWhere = [UIAlertAction actionWithTitle:@"NO" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [self.travelLabel setText:@"Stay Home"];
    }];
    
    UIAlertAction *noWhere2 = [UIAlertAction actionWithTitle:@"NO" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [self.travelLabel setText:@"Stay Home"];
    }];
    
    // action ADD
    [travelAlert addAction:noWhere];
    [travelAlert addAction:noWhere2];
    [travelAlert addAction:italy];
    [travelAlert addAction:russia];
    [travelAlert addAction:egypt];

    
    
    // 화면에 보이기
    [self presentViewController:travelAlert animated:YES completion:nil];

}

- (IBAction)alertSheetAction:(id)sender {

    UIAlertController *companyAlert = [UIAlertController alertControllerWithTitle:@"COMPANY" message:@"Where Do You Want To Go?" preferredStyle:UIAlertControllerStyleActionSheet];

    UIAlertAction *apple = [UIAlertAction actionWithTitle:@"Apple" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.companyLabel setText:@"Apple"];
    }];
    
    UIAlertAction *google = [UIAlertAction actionWithTitle:@"Google" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.companyLabel setText:@"Google"];
    }];
    
    UIAlertAction *kakao = [UIAlertAction actionWithTitle:@"Kakao" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.companyLabel setText:@"Kakao"];
    }];
    
    UIAlertAction *noWhere = [UIAlertAction actionWithTitle:@"NO" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [self.companyLabel setText:@"Stay Home"];
    }];

    UIAlertAction *noWhere2 = [UIAlertAction actionWithTitle:@"NO" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [self.companyLabel setText:@"Stay Home"];
    }];
    [companyAlert addAction:noWhere];

    [companyAlert addAction:kakao];

    [companyAlert addAction:apple];
    [companyAlert addAction:google];
    [companyAlert addAction:noWhere2];

    [self presentViewController:companyAlert animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
