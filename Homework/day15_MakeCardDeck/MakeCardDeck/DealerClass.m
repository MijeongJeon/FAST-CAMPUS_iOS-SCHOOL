//
//  DealerClass.m
//  MakeCardDeck
//
//  Created by Mijeong Jeon on 5/12/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import "DealerClass.h"
#import "CardClass.h"


@implementation DealerClass
{
    NSString *typeCard;
    NSString *numberCard;
    NSString *colorCard;
    NSMutableArray *cardDeck;
}

// 카드 타입, 숫자, 색 입력 - 52장 만들기
- (void)createCardDeck
{
    if (cardDeck == nil) {
        cardDeck = [[NSMutableArray alloc] initWithCapacity:1];
    }
    for (NSInteger i = 1; i<5 ; i++) {
        switch (i) {
            case 1:
                typeCard = @"♠︎";
                colorCard= @"black";
                break;
            case 2:
                typeCard = @"♣︎";
                colorCard = @"black";
                break;
            case 3:
                typeCard = @"♥︎";
                colorCard = @"red  ";
                break;
            default:
                typeCard = @"♦︎";
                colorCard = @"red  ";
                break;
        }
        for (NSInteger i =1; i<14; i++) {
            switch (i) {
                case 1:
                    numberCard = @"ACE";
                    break;
                case 11:
                    numberCard = @"J";
                    break;
                case 12:
                    numberCard = @"Q";
                    break;
                case 13:
                    numberCard = @"K";
                    break;
                default:
                    numberCard = [NSString stringWithFormat:(@"%ld"), i];
                    break;
            }
            numberCard = [NSString stringWithFormat:@"%@",numberCard];
            CardClass *card = [[CardClass alloc]initWithCardType:typeCard Number:numberCard Color:colorCard];
            [cardDeck addObject:card];
        }
    }
}

// 랜덤 숫자 만들기
- (NSInteger)createRandomNumber
{
    NSInteger ranNum = arc4random()%52;
    return ranNum;
}

// 덱 섞기
- (NSMutableArray *)shuffleDeckIdx
{
    for (int i =0 ; i <100 ; i++) {
        [cardDeck exchangeObjectAtIndex:[self createRandomNumber] withObjectAtIndex:[self createRandomNumber]];
    }
    
    return cardDeck;
}

// 카드 덱 출력
- (void)printCardDeck
{
    for (CardClass *cards in [self shuffleDeckIdx]) {
        NSLog(@"%@ %@ %@",[cards type],[cards color],[cards number]);
    }
}

@end
