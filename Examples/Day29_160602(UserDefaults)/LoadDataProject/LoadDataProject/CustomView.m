//
//  CustomView.m
//  LoadDataProject
//
//  Created by youngmin joo on 2016. 6. 1..
//  Copyright © 2016년 WingsCompany. All rights reserved.
//

#import "CustomView.h"

@interface CustomView()

@property (nonatomic, strong) NSDictionary *userData;
@property (nonatomic, weak) UILabel *nameLb;
@property (nonatomic, weak) UILabel *phoneNumLb;

@end

@implementation CustomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)setData:(NSDictionary *)data
{
    self.userData = data;
}

- (void)createView
{
    UILabel *nameLb = [[UILabel alloc] init];
    [nameLb setTextAlignment:NSTextAlignmentCenter];
    [nameLb setFont:[UIFont boldSystemFontOfSize:20]];
    [self addSubview:nameLb];
    self.nameLb = nameLb;
    
    UILabel *phoneNumLb = [[UILabel alloc] init];
    [phoneNumLb setTextAlignment:NSTextAlignmentCenter];
    [nameLb setFont:[UIFont systemFontOfSize:18]];
    [self addSubview:phoneNumLb];
    self.phoneNumLb = phoneNumLb;
}

- (void)updateLayout
{
    CGFloat offsetY = 10;
    
    [self.nameLb setFrame:CGRectMake(0, offsetY, self.frame.size.width, 30)];
    offsetY += self.nameLb.frame.size.height + 10;
    [self.phoneNumLb setFrame:CGRectMake(0, offsetY, self.frame.size.width, 30)];
    
    [self updataData];
}


- (void)updataData
{
    if (self.userData != nil) {
        [self.nameLb setText:[self.userData objectForKey:@"name"]];
        [self.phoneNumLb setText:[self.userData objectForKey:@"phone"]];
    }
    
}

@end
