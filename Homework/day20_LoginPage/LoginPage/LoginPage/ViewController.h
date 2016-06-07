//
//  ViewController.h
//  LoginPage
//
//  Created by Mijeong Jeon on 5/23/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (void)showAlert:(NSString *)failTitle andMessage:(NSString *)failMessage andidField:(UITextField *)idField  andVC:(UIViewController *)VC;
@end

