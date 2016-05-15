//
//  CardClass.m
//  MakeCardDeck
//
//  Created by Mijeong Jeon on 5/12/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "CardClass.h"

@implementation CardClass
{
    NSString *typeCard;
    NSString *numberCard;
    NSString *colorCard;
}

// 빈 카드 제작(타입, 숫자, 색 속성)
- (id)initWithCardType:(NSString *)Type Number:(NSString *)Number Color:(NSString *)Color
{
    self = [super init];
    if (self) {
        typeCard = Type;
        colorCard = Color;
        numberCard = Number;
    }
    return self;
}

// 타입 반환
- (NSString *)type
{
    return typeCard;
}

// 숫자 반환
- (NSString *)number
{
    return numberCard;
}

// 색 반환
- (NSString *)color
{
    return colorCard;
}


@end
