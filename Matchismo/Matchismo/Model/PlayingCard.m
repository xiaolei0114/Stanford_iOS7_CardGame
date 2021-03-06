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
