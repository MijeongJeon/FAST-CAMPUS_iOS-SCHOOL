//
//  ViewController.m
//  LoadDataProject
//
//  Created by youngmin joo on 2016. 6. 1..
//  Copyright © 2016년 WingsCompany. All rights reserved.
//

#import "ViewController.h"
#import "DataCenter.h"
#import "CustomView.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIScrollView *mainScroll;
@property (nonatomic, strong) NSArray *friendList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //데이터 불러오기
    self.friendList = [NSArray arrayWithArray:[[DataCenter shardInstance] friendList]];

    
    //뷰 만들기
    CGFloat viewOffsetY = 20;
    CGSize viewSize = CGSizeMake(200, 100);
    for(NSDictionary *personDic in self.friendList)
    {
        CustomView *cView = [[CustomView alloc] initWithFrame:CGRectMake(0, viewOffsetY, viewSize.width, viewSize.height)];
        [cView setData:personDic];
        [cView setBackgroundColor:[UIColor lightGrayColor]];
        [cView updateLayout];
        [self.mainScroll addSubview:cView];
        
        viewOffsetY += viewSize.height + 10;
    }
    
    [self.mainScroll setContentSize:CGSizeMake(self.view.frame.size.width, viewOffsetY)];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
