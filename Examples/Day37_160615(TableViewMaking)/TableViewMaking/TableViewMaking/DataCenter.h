//
//  DataCenter.h
//  TableViewMaking
//
//  Created by Mijeong Jeon on 6/15/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataCenter : NSObject

+ (instancetype)defaultData;


- (NSDictionary *)allData;
- (NSArray *)dataDicTitle;
- (NSDictionary *)allDetailData;

@end
