//
//  WebViewController.h
//  AVWSamples
//
//  Created by Paul Marcos on 11/30/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <AudioToolbox/AudioToolbox.h>

@interface WebViewController : UIViewController {
	UIWebView *webView;
	UIButton *backButton;
	UIButton *forwardButton;
	UILabel *statusLabel;
	UIActivityIndicatorView *progressIndicator;
	SystemSoundID soundID;
}

@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) IBOutlet UIButton *backButton;
@property (nonatomic, retain) IBOutlet UIButton *forwardButton;
@property (nonatomic, retain) IBOutlet UILabel *statusLabel;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *progressIndicator;

- (void)playSound;

@end
