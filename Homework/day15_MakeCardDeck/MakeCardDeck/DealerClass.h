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
- (void)createCardDeck;
- (void)printCardDeck;
- (NSMutableArray *)shuffleDeckIdx;

@end
