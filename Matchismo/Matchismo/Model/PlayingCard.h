//
//  PlayingCard.h
//  Matchismo
//
//  Created by Zhang Xinlei on 11/26/14.
//  Copyright (c) 2014 CS193p. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (nonatomic, strong) NSString *suit;
@property (nonatomic) NSInteger rank;

+ (NSArray *) validSuits;
+ (NSArray *) validRanks;
+ (NSUInteger) maxRank;
@end
