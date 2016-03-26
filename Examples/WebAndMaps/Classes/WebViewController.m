//
//  WebViewController.m
//  Untitled
//
//  Created by Alan Cannistraro on 2/11/10.
//  Copyright 2010 Apple. All rights reserved.
//

#import "WebViewController.h"


@implementation WebViewController

@synthesize url;

- (void)loadURL
{
	NSURLRequest	*request = [NSURLRequest requestWithURL:self.url];
	[webView loadRequest:request];

	addressField.text = url.absoluteString;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	self.url = [NSURL URLWithString:textField.text];

	[self loadURL];
	[textField resignFirstResponder];
	
	return YES;
}
/*
- (void)webViewDidStartLoad:(UIWebView *)webView
{
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}
*/

- (void)viewWillAppear:(BOOL)animated
{
	if (!self.url)
		self.url = [NSURL URLWithString:@"http://research.engineering.wustl.edu/~todd/cse436/"];

	[self loadURL];
}

- (void)dealloc {
	[url release];
	[addressField release];
	[webView release];
    [super dealloc];
}

@end
