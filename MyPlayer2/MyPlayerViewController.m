//
//  MyPlayerViewController.m
//  MyPlayer2
//
//  Created by Vijayakumar, Naren on 7/5/12.
//  Copyright (c) 2012 Akamai All rights reserved.
//

#import "MyPlayerViewController.h"
#import <CoreMedia/CoreMedia.h>

@interface MyPlayerViewController ()

-(void) installMovieNotificationObservers;
-(void)playVideo:(NSString*)videoName;
-(void)videoFinishedPlaying;

@property int questionNumber;

@end


@implementation MyPlayerViewController


//@synthesize movieURLTextField = _movieURLTextField;
@synthesize myPlayerView = _myPlayerView;
//@synthesize timedMetadataLabel = _timedMetadataLabel;
//@synthesize mediaAccessLogTextView = _mediaAccessLogTextView;
@synthesize player = _player;
//@synthesize timer = _timer;
@synthesize questionNumber = _questionNumber;
@synthesize answerTextField = _answerTextField;


-(void)playVideo:(NSString *)videoName
{
    //NSURL* videoURL = [[NSURL alloc] initFileURLWithPath:videoName];
    
    NSURL* videoURL = [[NSBundle mainBundle] URLForResource:videoName withExtension:nil];
    
    if ([videoURL scheme]) {
        NSLog(@"Video url is %@", videoURL);
        //setup movie player
        
        self.player  = [[MPMoviePlayerController alloc] initWithContentURL:videoURL];
        [self installMovieNotificationObservers];
        [self.player prepareToPlay];
        
        [self.player.view setFrame:self.myPlayerView.frame];
        [self.view addSubview:self.player.view];
        [self.player play];

        //[self.player play];
        
        
    }
    else
    {
        NSLog(@"Invalid video url %@", videoURL);
    }
}

-(IBAction)loadMovie:(UIButton*)sender
{
    NSLog(@"Load button pressed");
    
    //hide keyboard
    [self.view endEditing:YES];
    
    if (self.questionNumber==0 && [self.answerTextField.text isEqualToString:@"0101"]) {
        [self playVideo:@"zylo.MOV"];
    }
    else if (self.questionNumber==1 && [self.answerTextField.text isEqualToString:@"0102"]) {
        [self playVideo:@"video2.mp4"];
    }
}

/*

- (IBAction)loadMovieButtonPressed:(UIButton*)sender {
    
    //get the movie URL    
    NSURL* movieURL = [NSURL URLWithString:self.movieURLTextField.text];
    
    if ([movieURL scheme]) {
    
        NSLog(@"Movie URL is %@", movieURL);

        //set up the Movie Player Controller
        
        self.player = [ [MPMoviePlayerController alloc] initWithContentURL:movieURL];
        
        if ([self.player respondsToSelector:@selector(loadState)])
        {

            [self installMovieNotificationObservers];
            [self.player.view setFrame:self.myPlayerView.bounds];
            [self.myPlayerView addSubview:self.player.view];
            
            self.player.scalingMode = MPMovieScalingModeAspectFit;
            
            //install the timer to get access log
            self.timer =  [ NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(getMPMovieAccessLog:) userInfo:nil repeats:YES];
            NSLog(@"Play command sent");
        }
        
        //hide the buttons
        self.movieURLTextField.hidden = YES;
        self.loadMovieButton.hidden = YES;
        self.myPlayerView.hidden = NO;
        //hide keyboard
        [self.view endEditing:YES];

    }
    else {
        NSLog(@"Invalid movie - %@", movieURL);
    }
        
}
*/



-(void) installMovieNotificationObservers
{
    
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(videoFinishedPlaying)
                                                name:MPMoviePlayerPlaybackDidFinishNotification
                                              object:nil];
}



-(void)videoFinishedPlaying
{
    
    //load next question
    //increment question number
    self.questionNumber += 1;
    NSLog(@"Video finished playing, switching to question %d", [self questionNumber]);
    
    
}




- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    //return interfaceOrientation == UIInterfaceOrientationIsLandscape(interfaceOrientation);
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight || interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

@end
