//
//  LetsMakeAThreadAppDelegate.m
//  LetsMakeAThread
//
//  Created by Evan Doll on 10/27/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import "LetsMakeAThreadAppDelegate.h"

@implementation LetsMakeAThreadAppDelegate

@synthesize window;
@synthesize spinner;
@synthesize answerLabel;
@synthesize button;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    answerLabel.text = @"";
    
    // Override point for customization after application launch
    [window makeKeyAndVisible];
}

- (IBAction)beginDeepThought:(id)sender
{
    [spinner startAnimating];
    button.hidden = YES;
  
	//FixMe
	[self backgroundThinking];
//    [NSThread detachNewThreadSelector:@selector(backgroundThinking) toTarget:self withObject:nil];
}

- (void)backgroundThinking
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    [NSThread sleepForTimeInterval:5];
    [self performSelectorOnMainThread:@selector(didFindAnswer:) withObject:@"42" waitUntilDone:NO];
    [pool release];
}

- (void)didFindAnswer:(NSString *)answer
{
    [spinner stopAnimating];
    answerLabel.text = answer;
}

- (void)dealloc {
    [window release];
    [spinner release];
    [answerLabel release];
    [button release];
    
    [super dealloc];
}


@end
