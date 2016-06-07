//
//  CardClass.h
//  MakeCardDeck
//
//  Created by Mijeong Jeon on 5/12/16.
//  Copyright © 2016 Mijeong Jeon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CardClass : NSObject

@property (nonatomic, strong)NSString *type;
@property (nonatomic, strong)NSString *color;
@property (nonatomic, strong)NSString *number;

- (instancetype)initWithCardType:(NSString *)Type Number:(NSString *)Number Color:(NSString *)Color;

@end
