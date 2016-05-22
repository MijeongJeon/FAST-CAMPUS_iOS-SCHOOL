//
//  CardClass.m
//  MakeCardDeck
//
//  Created by Mijeong Jeon on 5/12/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "CardClass.h"

@implementation CardClass

// 빈 카드 제작(타입, 숫자, 색 속성)
- (id)initWithCardType:(NSString *)type Number:(NSString *)number Color:(NSString *)color
{
    self = [super init];
    if (self) {
        self.type = type;
        self.color = color;
        self.number = number;
    }
    return self;
}

@end
