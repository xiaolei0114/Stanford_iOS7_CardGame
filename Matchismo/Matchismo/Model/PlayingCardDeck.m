//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by Zhang Xinlei on 11/27/14.
//  Copyright (c) 2014 CS193p. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

-(instancetype)init
{
    //make sure we initialize ourself if super has been initialized
    //or we return nil if the super hasn'been properly initialized.
    self = [super init];
    
    if (self) {
        for (NSString * suit in [PlayingCard validSuits]) {
            for (NSUInteger rank = 1; rank <=[PlayingCard maxRank]; rank++ ) {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.suit = suit;
                card.rank = rank;
                [self addCard:card];
            }
        }
    }
    
    return self;
}
@end
