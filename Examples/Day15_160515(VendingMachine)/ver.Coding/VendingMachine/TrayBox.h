//
//  TrayBox.h
//  VendingMachine
//
//  Created by Mijeong Jeon on 5/13/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DrinkObject.h"

static const NSInteger maximumDrinkCount = 4;

@interface TrayBox : NSObject

@property (nonatomic, readonly) NSArray *drinkKinds;

@end
