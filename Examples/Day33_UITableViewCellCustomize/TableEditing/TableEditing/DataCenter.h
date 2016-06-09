//
//  DataCenter.h
//  TableEditing
//
//  Created by Mijeong Jeon on 6/9/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface DataCenter : NSObject

+ (instancetype)defaultData;

- (NSMutableArray *)dataForSection:(NSInteger)section;
- (void)removeFirstSectionDataAtIndexes:(NSInteger)indexes;
- (void)insertNewDataForSecondSection;

@end
