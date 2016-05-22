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


// 카드 타입, 숫자, 색 입력 - 52장 만들기
- (void)createCardDeck {
    if (_cardDeck == nil) {
        _cardDeck = [[NSMutableArray alloc] initWithCapacity:1];
    }
    for (NSInteger i = 1; i<5 ; i++) {
        switch (i) {
            case 1:
                _typeCard = @"♠︎";
                _colorCard= @"black";
                
                break;
            case 2:
                _typeCard = @"♣︎";
                _colorCard = @"black";
                break;
            case 3:
                _typeCard = @"♥︎";
                _colorCard = @"red  ";
                break;
            default:
                _typeCard = @"♦︎";
                _colorCard = @"red  ";
                break;
        }
        for (NSInteger i =1; i<14; i++) {
            switch (i) {
                case 1:
                    _numberCard = @"ACE";
                    break;
                case 11:
                    _numberCard = @"J";
                    break;
                case 12:
                    _numberCard = @"Q";
                    break;
                case 13:
    
                    
                    _numberCard = @"K";
                    break;
                default:
                    _numberCard = [NSString stringWithFormat:(@"%ld"), i];
                    break;
            }
       _numberCard = [NSString stringWithFormat:@"%@",_numberCard];
            CardClass *card = [[CardClass alloc] initWithCardType:_typeCard Number:_numberCard Color:_colorCard];
            [_cardDeck addObject:card];
        }
    }
    _cardDeck = [self shuffleDeckIdx];
}

// 랜덤 숫자 만들기
- (NSInteger)createRandomNumber {
    NSInteger ranNum = arc4random()%_cardDeck.count;
    return ranNum;
}

// 덱 섞기
- (NSMutableArray *)shuffleDeckIdx {
    for (int i =0 ; i <_cardDeck.count ; i++) {
        [_cardDeck exchangeObjectAtIndex:i withObjectAtIndex:[self createRandomNumber]];
    }
    
    return _cardDeck;
}

// 카드 덱 출력
- (void)printCardDeck {
    for (CardClass *cards in _cardDeck) {
        NSLog(@"%@ %@ %@", cards.type, cards.color, cards.number);
    }
}

@end
