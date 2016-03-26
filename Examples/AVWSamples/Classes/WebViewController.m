//
//  WebViewController.m
//  AVWSamples
//
//  Created by Paul Marcos on 11/30/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "WebViewController.h"


@implementation WebViewController

@synthesize webView;
@synthesize backButton;
@synthesize forwardButton;
@synthesize statusLabel;
@synthesize progressIndicator;

- (void)viewWillAppear:(BOOL)animated {
	NSString	*path = [[NSUserDefaults standardUserDefaults] objectForKey:@"defaultURL"];
	
	NSURL *url = [[NSURL alloc] initWithString:([path length] > 0 ? path : @"http://cs193p.stanford.edu/")];
	NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
	
	[webView loadRequest:request];
	
	[request release];
	[url release];
}


- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
	statusLabel.text = @"";
	[progressIndicator stopAnimating];
	NSLog(@"%s, error: %@", _cmd, error);
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
	NSURL *url = [request URL];
	NSString *hostname = [url host];
	
	// Only allow navigation to Stanford or Apple
	if (![hostname hasSuffix:@".stanford.edu"] && ![hostname hasSuffix:@".apple.com"] && navigationType == UIWebViewNavigationTypeLinkClicked) {
		NSLog (@"Denied request to go to: %@", url);
		[self playSound];
		return NO;
	}
	return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)aWebView {
	backButton.enabled = [webView canGoBack];
	forwardButton.enabled = [webView canGoForward];
	statusLabel.text = @"";
	[progressIndicator stopAnimating];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
	statusLabel.text = @"Loading...";
	[progressIndicator startAnimating];
}


- (void)disposeSound {
	if (soundID) {
		AudioServicesDisposeSystemSoundID(soundID);
		soundID = 0;
	}
}

- (void)playSound {
	if (soundID == 0) {
		NSString *path = [[NSBundle mainBundle] pathForResource:@"damn" ofType:@"caff"];
		NSURL *damnURL = [[NSURL alloc] initFileURLWithPath:path];
		
		AudioServicesCreateSystemSoundID ((CFURLRef)damnURL, &soundID);
		
		[damnURL release];
	}
	
	AudioServicesPlaySystemSound(soundID);
	
}

- (void)didReceiveMemoryWarning {
	[self disposeSound];
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
	[webView release];
	[backButton release];
	[forwardButton release];
	[statusLabel release];
	[progressIndicator release];
	
	[self disposeSound];
	
    [super dealloc];
}

@end
