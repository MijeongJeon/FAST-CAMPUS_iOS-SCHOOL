//
//  DealerClass.h
//  MakeCardDeck
//
//  Created by Mijeong Jeon on 5/12/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CardClass.h"

@interface DealerClass : CardClass

@property (nonatomic, strong)NSMutableArray *cardDeck;

@property (nonatomic, strong)NSString *colorCard;
@property (nonatomic, strong)NSString *numberCard;
@property (nonatomic, strong)NSString *typeCard;

- (void)createCardDeck;
- (void)printCardDeck;
- (NSMutableArray *)shuffleDeckIdx;

@end
