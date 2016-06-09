//
//  DataCenter.m
//  TableEditing
//
//  Created by Mijeong Jeon on 6/9/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "DataCenter.h"

@interface DataCenter()

@property (nonatomic, strong) NSMutableArray *firstSectionData;
@property (nonatomic, strong) NSMutableArray *secondSectionData;

@end


@implementation DataCenter

+ (instancetype)defaultData {
    
    static DataCenter *dataCenter = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataCenter = [[DataCenter alloc] init];
        dataCenter.firstSectionData  = [[NSMutableArray alloc] initWithObjects:@"A", @"B", @"C", nil];
        dataCenter.secondSectionData  = [[NSMutableArray alloc] initWithObjects:@"D", @"E", @"F", nil];
    });
    return dataCenter;
}

- (NSMutableArray *)dataForSection:(NSInteger)section {
    if (section == 0) {
        return self.firstSectionData;
    }
    return self.secondSectionData;
}
    
- (void)insertNewDataForSecondSection {
    [self.secondSectionData addObject:@"New Data"];
}

- (void)removeFirstSectionDataAtIndexes:(NSInteger)indexes {
    [self.firstSectionData removeObjectAtIndex:indexes];
}

@end
