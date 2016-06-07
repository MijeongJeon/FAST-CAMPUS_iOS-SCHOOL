//
//  TrayBox.m
//  VendingMachine
//
//  Created by Mijeong Jeon on 5/13/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "TrayBox.h"

@interface TrayBox()

@property (nonatomic, nullable) NSArray *nameList;
@property (nonatomic, nullable) NSArray *costList;
@property (nonatomic) NSArray *drinkKinds;

@end

@implementation TrayBox

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.nameList = @[@"radiohead", @"Beatles", @"Coldplay", @"Maroon5"];
        self.costList = @[@1000,@800,@1200,@1500];
        [self createTray];
    }
    return self;
}

- (void)createTray
{
    NSMutableArray *drinkList = [[NSMutableArray alloc] init];
    for (int i=0; i < maximumDrinkCount; i++) {
        NSString *drinkName = _nameList[i];
        NSInteger drinkCost = ((NSNumber *)_costList[i]).integerValue;
        DrinkObject *drink = [[DrinkObject alloc] initWithName:drinkName cost:drinkCost];
        [drinkList addObject:drink];
    }
    self.drinkKinds = [[NSArray alloc] initWithArray:drinkList];
}


@end
