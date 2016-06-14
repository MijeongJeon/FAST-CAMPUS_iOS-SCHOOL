//
//  ThirdViewController.h
//  PageMaking
//
//  Created by Mijeong Jeon on 6/13/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "FirstViewController.h"

@protocol ThirdViewLabelDelegate <NSObject>

- (NSString *)setLabel;

@end

@interface ThirdViewController : UIViewController
@property (strong, nonatomic) id <ThirdViewLabelDelegate> delegate;
@end
