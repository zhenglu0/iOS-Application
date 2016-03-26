//
//  AudioViewController.h
//  AVWSamples
//
//  Created by Paul Marcos on 11/30/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface AudioViewController : UIViewController <AVAudioPlayerDelegate> {
	UIButton *longSoundButton;
	
	SystemSoundID soundID;
	AVAudioPlayer *player;
}

@property (nonatomic, retain) IBOutlet UIButton *longSoundButton;
@property (nonatomic, retain) AVAudioPlayer *player;

- (IBAction)playShortSound;

- (IBAction)playLongSound;
//- (IBAction)skipForward;
//- (IBAction)skipBack;
//- (IBAction)scrubAudio:(id)sender;

@end
