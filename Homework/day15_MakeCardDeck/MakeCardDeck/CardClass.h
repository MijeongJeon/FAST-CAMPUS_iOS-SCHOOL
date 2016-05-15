//
//  CardClass.h
//  MakeCardDeck
//
//  Created by Mijeong Jeon on 5/12/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CardClass : NSObject

- (instancetype)initWithCardType:(NSString *)Type Number:(NSString *)Number Color:(NSString *)Color;
- (NSString *)type;
- (NSString *)number;
- (NSString *)color;

@end
