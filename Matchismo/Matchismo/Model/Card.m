//
//  Card.m
//  Matchismo
//
//  Created by Zhang Xinlei on 11/26/14.
//  Copyright (c) 2014 CS193p. All rights reserved.
//

#import "Card.h"

@implementation Card

-(int)match:(NSArray *)othercards
{
    int score = 0;
    
    for(Card *card in othercards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    
    return score;
}

@end
