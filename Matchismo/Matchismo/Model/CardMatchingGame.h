//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Zhang Xinlei on 11/30/14.
//  Copyright (c) 2014 CS193p. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"
@interface CardMatchingGame : NSObject

//designated initializer
//it means that it is not legally initialized unless this get called at some point
-(instancetype)initWithCardCount:(NSUInteger)count
                       usingDeck:(Deck *) deck;

//The behavior happens in model when user clicked at a card.
-(void)chooseCardAtIndex: (NSUInteger) index;

//return a card at an indexed position
-(Card*)cardAtIndex: (NSUInteger) index;

@property (nonatomic, readonly) NSInteger score;
@end
