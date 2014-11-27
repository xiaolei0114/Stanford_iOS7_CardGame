//
//  ViewController.m
//  Matchismo
//
//  Created by Zhang Xinlei on 11/25/14.
//  Copyright (c) 2014 CS193p. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//note it is weak, and this is called outlet.
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck *deck;
@end


@implementation ViewController

-(Deck *) deck
{
    if (!_deck) _deck = [[Deck alloc]init];
    //Need 52 pieces of cards
    //initialize them with different suit and rank
    //add to the deck
    for (NSString *suit in [PlayingCard validSuits])
    {
        for (NSUInteger rank = 1; rank <= [PlayingCard maxRank];rank++) {
            PlayingCard *card = [ [PlayingCard alloc] init];
            card.suit = suit;
            card.rank = rank;
            [_deck addCard:card];
        }
    }
    return _deck;
}

- (void) setFlipCount:(int)flipCount {
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips:%d",self.flipCount];
    NSLog(@"You have clicked %d times !",self.flipCount);
}

//"Sender" is the object that will send messages to the controller
- (IBAction)touchCardButton:(UIButton *)sender {
    
    
    //draw a random card from our deck untill the deck runs out
    //display its info in current Title
    PlayingCard *card = [self.deck drawRandomCard];
    [sender setTitle:card.contents forState:UIControlStateNormal];
    
    
    /*
    if ([sender.currentTitle isEqualToString:@"First Try ☀︎"]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"icon_back_256"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"Fight on!" forState:UIControlStateNormal];
    }
    else {
        [sender setBackgroundImage:[UIImage imageNamed:@"icon_front_256"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"First Try ☀︎" forState:UIControlStateNormal];
    }
     */
    self.flipCount++;
}


@end
