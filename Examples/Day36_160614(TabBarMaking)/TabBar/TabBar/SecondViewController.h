//
//  SecondViewController.h
//  TabBar
//
//  Created by Mijeong Jeon on 6/14/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SecondViewLabelDelegate <NSObject>

- (NSString *)secondViewLabel;

@end

@interface SecondViewController : UIViewController 

@property (weak, nonatomic) id<SecondViewLabelDelegate> delegate;
@property (nonatomic) BOOL isModalButton;

@end
