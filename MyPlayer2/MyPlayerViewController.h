//
//  MyPlayerViewController.h
//  MyPlayer2
//
//  Created by Vijayakumar, Naren on 7/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>


#import "MyPlayerView.h"


@interface MyPlayerViewController : UIViewController


//@property (weak, nonatomic) IBOutlet UITextField *movieURLTextField;
@property (weak, nonatomic) IBOutlet MyPlayerView *myPlayerView;
//@property (weak, nonatomic) IBOutlet UITextView *timedMetadataLabel;
//@property (weak, nonatomic) IBOutlet UIImageView *mixedRegionImageView;
//@property (weak, nonatomic) IBOutlet UITextView *mediaAccessLogTextView;



@property (strong, nonatomic) MPMoviePlayerController *player;


@property  (weak, nonatomic) IBOutlet UIButton *loadMovieButton;



@property (weak, nonatomic) IBOutlet UITextField *answerTextField;





//@property (weak, nonatomic) IBOutlet UIImageView *screenImage;

//@property (weak, nonatomic) IBOutlet UIButton *loadMovieButton;

//@property (nonatomic, weak) UIImage *screenCapture;

@end


//MPMoviePlayerController *player;