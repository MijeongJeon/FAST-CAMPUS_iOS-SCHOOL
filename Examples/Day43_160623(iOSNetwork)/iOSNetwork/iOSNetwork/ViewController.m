//
//  ViewController.m
//  iOSNetwork
//
//  Created by Mijeong Jeon on 6/23/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // session 객체 생성
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    // dataTask 생성 _ block 이용, UI에 반영하기 위해 GCD, main queue 이용
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:
                                      [NSURL URLWithString:@"https://i.ytimg.com/vi/JDSebIXpeJE/hqdefault.jpg"]
                                            completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                if (data.length >0 ) {
                                                    UIImage *image = [UIImage imageWithData:data];
                                                    dispatch_async(dispatch_get_main_queue(), ^{
                                                        [self.imageView setImage:image];
                                                    });
                                                }
                                            }];
    
    [dataTask resume];
    
    [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [UIView animateWithDuration:3
                     animations:^{
        [self.imageView setAlpha:0.1];
    } completion:^(BOOL finished) {
        [self.imageView setAlpha:1];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
