//
//  Deck.h
//  Matchismo
//
//  Created by Zhang Xinlei on 11/27/14.
//  Copyright (c) 2014 CS193p. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"


@interface Deck : NSObject

- (void) addCard: (Card *) card atTop:(BOOL)atTop;
- (void) addCard: (Card *) card;

- (Card*)drawRandomCard;
@end
