//
//  ViewController.m
//  UIScrollVied
//
//  Created by Mijeong Jeon on 5/27/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic)UIScrollView *scrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0,self.view.frame.size.width, self.view.frame.size.height)];
    [_scrollView setContentSize:CGSizeMake(_scrollView.frame.size.width*3, _scrollView.frame.size.height*3)];
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = NO;
    [self.view addSubview:_scrollView];
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, _scrollView.frame.size.width, _scrollView.frame.size.height)];
    [imageView1 setImage:[UIImage imageNamed:@"image"]];
    [_scrollView addSubview:imageView1];
    [imageView1 setContentMode:UIViewContentModeScaleAspectFill];
    [_scrollView setMaximumZoomScale:1];
    [_scrollView setMinimumZoomScale:3];
    [_scrollView setZoomScale:3];
 
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return scrollView;
    }

//    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(scrollView.frame.size.width, 0, scrollView.frame.size.width, scrollView.frame.size.height)];
//    [imageView2 setBackgroundColor:[UIColor greenColor]];
//    [scrollView addSubview:imageView2];`//
//    UIImageView *imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(scrollView.frame.size.width*2, 0, scrollView.frame.size.width, scrollView.frame.size.height)];
//    [imageView3 setBackgroundColor:[UIColor redColor]];
//    [scrollView addSubview:imageView3];



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
