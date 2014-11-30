//
//  PlayingCard.m
//  Matchismo
//
//  Created by Zhang Xinlei on 11/26/14.
//  Copyright (c) 2014 CS193p. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit = _suit;
- (NSString*) contents
{
    NSArray *rankStrings = [PlayingCard validRanks];
    //returning a string that has self.suit append to self.rank
    
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
    
}

//override the one from Card
-(int)match:(NSArray *)othercards {
    int score = 0;
    
    //currently only matches 2 cards
    if ([othercards count] == 1) {
        //first object will no crash when index = 0 contains no object
        PlayingCard *card = [othercards firstObject];
        if (card.rank == self.rank)
            score = 4;
        else if ([card.suit isEqualToString:self.suit])
            score = 1;
    }
    return score;
}

+ (NSArray *) validSuits {
    return @[@"♥",@"♦",@"♠",@"♣"];
}

- (void)setSuit:(NSString *)suit {
    //(BOOL)containsObject:(id)anObject
    //Returns a Boolean value that indicates whether a given object is present in the array.
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
    
}

- (NSString*) suit {
    return _suit ? _suit : @"?";
}

+ (NSArray *)validRanks {
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger) maxRank { return [ [self validRanks] count] -1;}

- (void)setRank:(NSInteger)rank {
    if (rank <= [PlayingCard maxRank]){
        _rank = rank;
    }
}
@end
