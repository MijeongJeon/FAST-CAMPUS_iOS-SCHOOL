//
//  SecondViewController.m
//  UIViewControlloer
//
//  Created by Mijeong Jeon on 5/31/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "SecondViewController.h"
#import "ViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationController setToolbarHidden:NO];
    [self createToolBar];
    [self createNavigationBar ];
    [self createTitle];
    NSLog(@"viewdidload_second");

}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"viewwillapper_second");

}

- (void)viewDidAppear:(BOOL)animated {
      NSLog(@"viewdidappear_second");

}
- (void)createTitle {
    
    self.navigationItem.title = @"title";
    
}

- (void)createNavigationBar {
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"UP", @"DOWN", nil]];
    
    //    [segmentedControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    
    segmentedControl.frame = CGRectMake(0, 0, 120, 35);
    segmentedControl.momentary = YES;
    
    UIBarButtonItem *segmentBarItem = [[UIBarButtonItem alloc] initWithCustomView:segmentedControl];
    self.navigationItem.rightBarButtonItem = segmentBarItem;
    
}

- (void)createToolBar {
    UIBarButtonItem *flexibleSpaceitem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    
    UISegmentedControl *sortToggle = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"Ascending",@"Descending",nil]];
    sortToggle.selectedSegmentIndex = 0;
    [sortToggle addTarget:self action:@selector(toggleSorting:) forControlEvents:UIControlEventValueChanged];
    
    UIBarButtonItem *sortToggleButtonItem = [[UIBarButtonItem alloc] initWithCustomView:sortToggle];
    self.toolbarItems = [NSArray arrayWithObjects:flexibleSpaceitem, sortToggleButtonItem, flexibleSpaceitem, nil];
    
}



- (void)toggleSorting:(UIButton *)sender {
    
}


- (IBAction)nextButton:(id)sender {
    // 화면전환(navigation)
    // 1. 객체 생성
    
    UIStoryboard *storyBoardB = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *viewController = [storyBoardB instantiateViewControllerWithIdentifier:@"mainVC"];
    
    // 2. push
    [self.navigationController pushViewController:viewController animated:YES];
    
    //3. modality
    
}


//
//- (void)segmentAction:(UIButton *)sender {
//
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
