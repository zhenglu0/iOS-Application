//
//  test_appAppDelegate.m
//  test-app
//
//  Copyright iPhoneDevTips.com All rights reserved.
//

#import "test_appAppDelegate.h"
#import "test_appViewController.h"

@implementation test_appAppDelegate

@synthesize window, vc;

- (void)applicationDidFinishLaunching:(UIApplication *)application 
{   
  // Create and initialize the window
	window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

	// Create primary view controller
	vc = [[test_appViewController alloc] init];
	[window addSubview:vc.view];	
    
  [window makeKeyAndVisible];
  
}

- (void)dealloc 
{
  [window release];
  [super dealloc];
}

@end
