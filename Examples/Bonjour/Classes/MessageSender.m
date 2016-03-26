//
//  MessageSender.m
//  Bonjour
//
//  Created by CS193P on 3/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MessageSender.h"


@implementation MessageSender

@synthesize netService;

- (void)viewWillAppear:(BOOL)animated
{
	[self.netService getInputStream:nil outputStream:&outputStream];
	outputStream.delegate = self;
	[outputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
	[outputStream open];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[outputStream close];
	[outputStream removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
	outputStream.delegate = nil;
	[outputStream release];
	outputStream = nil;
}

#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	NSData *data = [NSKeyedArchiver archivedDataWithRootObject:textField.text];
	[outputStream write:data.bytes maxLength:data.length];
	return YES;
}

@end
