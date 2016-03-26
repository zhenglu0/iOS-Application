//
//  BonjourAndStreamsAppDelegate.m
//  BonjourAndStreams
//
//  Created by Alan Cannistraro on 3/2/10.
//  Copyright Apple 2010. All rights reserved.
//

#import "BonjourAndStreamsAppDelegate.h"
#import "ReceiveServer.h"

@implementation BonjourAndStreamsAppDelegate

@synthesize window;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    

	
	receiveServer = [[ReceiveServer alloc] init];
    // Override point for customization after application launch
	
	nav.view.frame = [UIScreen mainScreen].applicationFrame;
	[window addSubview:nav.view];
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
