//
//  ViewController.h
//  BallGameFemina
//
//  Created by Femina Ernest on 5/13/13.
//  Copyright (c) 2013 Femina Ernest. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UIButton *startButton;
    NSTimer *randomMain;
    CGPoint pos;
    IBOutlet UIImageView *player;
    IBOutlet UIImageView *enemy;
}

-(IBAction)start;


@end
