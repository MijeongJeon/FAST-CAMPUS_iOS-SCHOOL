//
//  WeatherTableViewController.h
//  CustomTable
//
//  Created by Mijeong Jeon on 6/8/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, WeatherType) {
    WeatherTypeKorea = 0,
    WeatherTypeWorld
};
@interface WeatherTableViewController : UITableViewController

@property (nonatomic) WeatherType weatherTpye;

@end
