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
    if (!_deck) _deck = [[PlayingCardDeck alloc]init];
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
        //card is by default in its back
    if (![sender.currentTitle length]) { // it is currently in its back
        //draw a card
        Card *card = [self.deck drawRandomCard];
        if (card) {
            //coordinate its attribute to the label
            [sender setTitle:card.contents forState:UIControlStateNormal];
            //change the image to the front
            [sender setBackgroundImage:[UIImage imageNamed:@"icon_front_256"] forState:UIControlStateNormal];
            
            self.flipCount++;
        }
    }
    else {// it is currently in its front
        [sender setTitle:@"" forState:UIControlStateNormal];
        [sender setBackgroundImage:[UIImage imageNamed:@"icon_back_256"] forState:UIControlStateNormal];
        self.flipCount++;
    }
    
    
}


@end
