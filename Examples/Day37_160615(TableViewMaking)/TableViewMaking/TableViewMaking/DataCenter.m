//
//  DataCenter.m
//  TableViewMaking
//
//  Created by Mijeong Jeon on 6/15/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "DataCenter.h"
#import "SecondViewController.h"

@interface DataCenter ()
@property (strong, nonatomic) NSDictionary *dataDic;
@property (strong, nonatomic) NSDictionary *detailDic;


@end

@implementation DataCenter

+ (instancetype)defaultData {
    static DataCenter *dataCenter = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataCenter = [[DataCenter alloc] init];
        dataCenter.dataDic= @{@"Fast School":@[@"iOS", @"Web"],
                        @"Weather": @[@"World Weather", @"Korean Weather"]};
        dataCenter.detailDic = @{@"iOS": @[@"10:00 Scrum", @"10:30 Lecture", @"12:00 Lunch", @"14:00 iOS", @"18:00 Study", @"20:00 Homework"],
                                  @"Web":@[@"10:00 Scrum",@"12:30 Lunch", @"14:00 django", @"17:00 Quiz"],
                                  @"World Weather":@[@"Moscow", @"Firenze", @"Helsinki", @"Uganda", @"Sydney", @"Paris", @"Rome"],
                                  @"Korean Weather":@[@"Seoul", @"Busan", @"Daejeon", @"Gwangju", @"Dockdo"]};
    });
        return dataCenter;
}

//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        [self setData];
//    }
//    return self;
//}
//
//- (void)setData
//{
//    self.dataDic= @{@"Fast School":@[@"iOS", @"Web"],
//                    @"Weather": @[@"World Weather", @"Korea Weather"]};
//}

- (NSDictionary *)allData {

    return self.dataDic;
}

- (NSDictionary *)allDetailData {
    return self.detailDic;
}

- (NSArray *)dataDicTitle {
    NSArray *sortedArray = [self.dataDic.allKeys sortedArrayUsingSelector:@selector(compare:)];
    return sortedArray;
}

@end
