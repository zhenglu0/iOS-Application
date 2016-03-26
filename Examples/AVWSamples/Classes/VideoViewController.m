//
//  VideoViewController.m
//  AVWSamples
//
//  Created by Paul Marcos on 11/30/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "VideoViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@implementation VideoViewController

@synthesize player;

- (void)playVideoWithURL:(NSURL *)url showControls:(BOOL)showControls {
	if (!player) {
		player = [[MPMoviePlayerController alloc] initWithContentURL:url];
		
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didFinishPlaying:) name:MPMoviePlayerPlaybackDidFinishNotification object:player];
		
		if (!showControls) {
			player.scalingMode = MPMovieScalingModeAspectFill;
			player.movieControlMode = MPMovieControlModeHidden;
		}
		
		[player play];
	}
}

- (IBAction)playVideoWithControls {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"iphone" ofType:@"mov"];
    NSURL *url = [NSURL fileURLWithPath:path];

//	NSURL *url = [NSURL URLWithString:@"http://cs193p.stanford.edu/iStanfordAd.mp4"];

	[self playVideoWithURL:url showControls:YES];
}

- (IBAction)playVideoWithoutControls {
	NSString *moviePath = [[NSBundle mainBundle] pathForResource:@"cutscene" ofType:@"mov"];
	NSURL *url = [NSURL fileURLWithPath:moviePath];
	
	[self playVideoWithURL:url showControls:NO];
}

- (void)didFinishPlaying:(NSNotification *)notification {
	if (player == [notification object]) {	
		[[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:player];
		[player release];
		player = nil;
	}
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	[player release];
	
    [super dealloc];
}


@end
