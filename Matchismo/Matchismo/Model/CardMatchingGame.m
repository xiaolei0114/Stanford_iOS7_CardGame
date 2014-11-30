//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Zhang Xinlei on 11/30/14.
//  Copyright (c) 2014 CS193p. All rights reserved.
//

#import "CardMatchingGame.h"

@interface  CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic,strong) NSMutableArray *cards;//of card
@end

@implementation CardMatchingGame

- (NSMutableArray*)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

static const int MATCH_BONUS = 4;
static const int MISMATCH_PENALTY = 2;
static const int COST_TO_CHOOSE = 1;
-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];//super's designated initializer
    
    if (self ) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            }
            else {
                self = nil;//return nil when the program cannot be properly initialized.
                break;
            }
        }
        
        
    }
    
    return self;
}

-(void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    if (!card.isMatched) {
        if(card.isChosen) {
            card.Chosen = NO;
        }
        else {
            //match against other chosen cards
            for (Card *othercard in self.cards)
                if (othercard.isChosen && !othercard.isMatched) {
                    int matchscore = [card match:@[othercard]];
                    if (matchscore) {
                        self.score += matchscore * MATCH_BONUS;
                        card.isMatched = YES;
                        othercard.isMatched = YES;
                    }
                    else {
                        self.score -= MISMATCH_PENALTY;
                        othercard.chosen = NO;// put it back when mismatch
                    }
                    break;//if there is another card matched with the chosen one, then match succeeded because currently we only allow 2 cards to match.
                }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}

-(Card*) cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;
    
}

@end
