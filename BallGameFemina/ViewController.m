//
//  ViewController.m
//  BallGameFemina
//
//  Created by Femina Ernest on 5/13/13.
//  Copyright (c) 2013 Femina Ernest. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	 // this is x and y speed
    pos = CGPointMake(5.0, 4.0);
}

-(IBAction)start
{
    [startButton setHidden:YES];
    randomMain = [NSTimer scheduledTimerWithTimeInterval:(0.03) target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
}

-(void)onTimer
{
    [self checkCollision];
    
    enemy.center = CGPointMake(enemy.center.x+pos.x, enemy.center.y+pos.y);
    
    if(enemy.center.x > 320 || enemy.center.x <0)
        pos.x = -pos.x;
    if(enemy.center.y > 480 || enemy.center.y <0)
        pos.y = -pos.y;
}

-(void)checkCollision
{
    if(CGRectIntersectsRect(player.frame, enemy.frame))
    {
        [randomMain invalidate];
        [startButton setHidden:NO];
        
        CGRect frame = [player frame];
        frame.origin.x = 137.0f;
        frame.origin.y = 326.0;
        [player setFrame:frame];
        
        CGRect frame2 = [enemy frame];
        frame2.origin.x = 137.0f;
        frame2.origin.y = 20.0;
        [enemy setFrame:frame2];
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops! You Lost!!" message:@"You were hit! Try Again" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
        [alert show];
        
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *myTouch = [[event allTouches]anyObject];
    player.center = [myTouch locationInView:self.view];
}

- (void)didReceiveMemoryWarning

{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
