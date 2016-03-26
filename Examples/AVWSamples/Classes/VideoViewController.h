//
//  VideoViewController.h
//  AVWSamples
//
//  Created by Paul Marcos on 11/30/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>


@interface VideoViewController : UIViewController {
	MPMoviePlayerController *player;
}

@property (nonatomic, retain) MPMoviePlayerController *player;

- (IBAction)playVideoWithControls;
- (IBAction)playVideoWithoutControls;

@end
