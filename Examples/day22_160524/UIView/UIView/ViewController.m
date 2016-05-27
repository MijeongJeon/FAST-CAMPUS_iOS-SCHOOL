//
//  ViewController.m
//  UIView
//
//  Created by Mijeong Jeon on 5/24/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//********************** 1. 파랑빨강 계단 모양 만들기 **********************//
//    const CGFloat VIEW_HALF_WIDTH = self.view.frame.size.width/2;
//    
//    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,VIEW_HALF_WIDTH, self.view.frame.size.height)];
//    [self.view addSubview:leftView];
//    [leftView setBackgroundColor:[UIColor redColor]];
//    
//    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,leftView.frame.size.width, leftView.frame.size.width)];
//    [leftView addSubview:topView];
//    [topView setBackgroundColor:[UIColor blueColor]];
//    
//    UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(VIEW_HALF_WIDTH,0, VIEW_HALF_WIDTH, self.view.frame.size.height)];
//    [self.view addSubview:rightView];
//    [rightView setBackgroundColor:[UIColor blueColor]];
//    
//    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-VIEW_HALF_WIDTH, VIEW_HALF_WIDTH, VIEW_HALF_WIDTH)];
//    [rightView addSubview:bottomView];
//    [bottomView setBackgroundColor:[UIColor redColor]];

    
    
//********************** 2. 20 point 띄우기 **********************//
    
//    UIView *bigView = [[UIView alloc] initWithFrame:CGRectMake(20, 20, self.view.frame.size.width-40, self.view.frame.size.height-40)];
//    [self.view addSubview:bigView];
//    [bigView setBackgroundColor:[UIColor blackColor]];
//    
//    
//    UIView *smallView = [[UIView alloc] initWithFrame:CGRectMake(20, 20, bigView.frame.size.width-40, bigView.frame.size.height-40)];
//    [bigView addSubview:smallView];
//    [smallView setBackgroundColor:[UIColor yellowColor]];
    
    
    
//********************** 3. label 올리기 **********************//
//    CGFloat offssetY = 20;
//    CGFloat MARGIN = 20;
//
//        UIView *whiteView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height/2)];
//        [self.view addSubview:whiteView];
//        [whiteView setBackgroundColor:[UIColor whiteColor]];
//
//    
//    UILabel *firstLabel = [[UILabel alloc] initWithFrame:CGRectMake(MARGIN, offssetY,whiteView.frame.size.width-40, 35)];
//    firstLabel.text = @"예제 화면입니다.";
//    [firstLabel setTextColor:[UIColor blackColor]];
//    [firstLabel setTextAlignment:NSTextAlignmentLeft];
//    [whiteView addSubview:firstLabel];
//    
//    offssetY += firstLabel.frame.size.height;
//    
//    UILabel *secondLabel = [[UILabel alloc] initWithFrame:CGRectMake(MARGIN, offssetY, whiteView.frame.size.width-40, 35)];
//    secondLabel.text = @"예쁜 레이블입니다.";
//    [secondLabel setTextColor:[UIColor redColor]];
//    [secondLabel setTextAlignment:NSTextAlignmentRight];
//    [whiteView addSubview:secondLabel];
//    
//    offssetY += secondLabel.frame.size.height;
//    
//    
//    UIView *blackView = [[UIView alloc] initWithFrame:CGRectMake(MARGIN, offssetY,whiteView.frame.size.width-40,whiteView.frame.size.height-100)];
//    [whiteView addSubview:blackView];
//    [blackView setBackgroundColor:[UIColor blackColor]];
//    offssetY += blackView.frame.size.height;
//
//    UILabel *thirdLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, blackView.frame.size.height-35, blackView.frame.size.width, 35)];
//    thirdLabel.text = @"view위에있는 레이블이에요.";
//    [thirdLabel setTextColor:[UIColor whiteColor]];
//    [thirdLabel setTextAlignment:NSTextAlignmentRight];
//    [blackView addSubview:thirdLabel];
//    offssetY += thirdLabel.frame.size.height;
//
//    UILabel *forthLabel = [[UILabel alloc] initWithFrame:CGRectMake(MARGIN, offssetY,whiteView.frame.size.width, 35)];
//    forthLabel.text = @"중앙에 있어요.";
//    [forthLabel setTextColor:[UIColor blackColor]];
//    [forthLabel setTextAlignment:NSTextAlignmentCenter];
//    [whiteView addSubview:forthLabel];
//    offssetY += forthLabel.frame.size.height;
//
//    UILabel *fifthLabel = [[UILabel alloc] initWithFrame:CGRectMake(MARGIN, offssetY, whiteView.frame.size.width, 35)];
//    fifthLabel.text = @"폰트가 20이에요.";
//    [fifthLabel setFont:[UIFont systemFontOfSize:20]];
//    [fifthLabel setTextColor:[UIColor blackColor]];
//    [fifthLabel setTextAlignment:NSTextAlignmentCenter];
//    [whiteView addSubview:fifthLabel];

//********************** 4. 이미지 **********************//
    
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 100, 300)];
    [imgView setImage:[UIImage imageNamed:@"The_Kiss_-_Gustav_Klimt_-_Google_Cultural_Institute.jpg"]];
//    [imgView setImage:[UIImage imageNamed:@"bgr1"]];

    [imgView setBackgroundColor:[UIColor purpleColor]];
        [imgView setContentMode:UIViewContentModeScaleAspectFill];
    [self.view addSubview:imgView];

    [imgView setClipsToBounds:YES];
//    [imgView setContentMode:UIViewContentModeScaleAspectFit];
//    [imgView setContentMode:UIViewContentModeScaleToFill];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
