//
//  ViewController.m
//  PropertyAndKVO
//
//  Created by Mijeong Jeon on 6/9/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic) NSInteger count;
@property (nonatomic, weak) IBOutlet UILabel *countLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // obsever는 한번만 등록해주면된다.
    [self addObserver:self
           forKeyPath:@"count"
              options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld
              context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSString *,id> *)change
                       context:(void *)context {
    NSLog(@"%@", change);

    // dictionary에는 참조형 데이터가 저장된다.
    NSNumber *kindValue = [change objectForKey:NSKeyValueChangeKindKey];
    NSNumber *newValue = [change objectForKey:NSKeyValueChangeNewKey];

    NSLog(@"kind%@, new:%@",kindValue,newValue);
    [self.countLabel setText:[NSString stringWithFormat:@"%@", newValue]];

}


- (IBAction)clickAddButton:(id)sender {
    self.count = self.count + 2;
    NSLog((@"%ld"),self.count);
}

- (IBAction)clickSubButton:(id)sender {
    self.count = self.count - 2;
    NSLog((@"%ld"),self.count);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
