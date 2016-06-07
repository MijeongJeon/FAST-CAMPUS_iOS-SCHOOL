//
//  main.m
//  MakeCardDeck
//
//  Created by Mijeong Jeon on 5/12/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DealerClass.h"

int main(int argc, const char * argv[]) {
   
    DealerClass *dealerCard = [[DealerClass alloc]init];
    
    [dealerCard createCardDeck];
    [dealerCard shuffleDeckIdx];
    [dealerCard printCardDeck];
    
    return 0;
}
