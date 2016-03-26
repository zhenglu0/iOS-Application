//
//  AudioViewController.m
//  AVWSamples
//
//  Created by Paul Marcos on 11/30/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "AudioViewController.h"


@implementation AudioViewController

@synthesize longSoundButton;
@synthesize player;

- (IBAction)playShortSound {
	if (soundID == 0) {
		NSString *path = [[NSBundle mainBundle] pathForResource:@"twang" ofType:@"caff"];
		NSURL *url = [NSURL fileURLWithPath:path];
		
		AudioServicesCreateSystemSoundID ((CFURLRef)url, &soundID);
	}
	
	AudioServicesPlaySystemSound(soundID);
}

- (void)pause {
	[player pause];
	[longSoundButton setTitle:@"Play Long Sound" forState:UIControlStateNormal];
	
	AudioSessionSetActive(false);
}

- (void)play {	
	[player play];
	[longSoundButton setTitle:@"Pause" forState:UIControlStateNormal];
	
	UInt32 category = kAudioSessionCategory_MediaPlayback;
    AudioSessionSetProperty (kAudioSessionProperty_AudioCategory, sizeof (category), &category);
    AudioSessionSetActive (true);	
}

- (IBAction)playLongSound {
	if (!player) {
		NSError *error = nil;
		NSString *path = [[NSBundle mainBundle] pathForResource:@"shortmusic" ofType:@"mp3"];
		NSURL *url = [NSURL fileURLWithPath:path];

		player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
		player.delegate = self;
	}
	
	if (player.playing) {
		[self pause];
	} else if (player) {
		[self play];
	}
}



- (void)audioPlayerBeginInterruption:(AVAudioPlayer *)thePlayer{
	if (thePlayer == player) {
		[self pause];
	}
}

- (void)audioPlayerEndInterruption:(AVAudioPlayer *)thePlayer{
	if (thePlayer == player) {
		[self play];
	}
}


- (void)disposeSound {
	if (soundID) {
		AudioServicesDisposeSystemSoundID(soundID);
		soundID = 0;
	}

	[player release];
	player = nil;
}

- (void)didReceiveMemoryWarning {
	[self disposeSound];
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
	[self disposeSound];
	
    [super dealloc];
}


@end
