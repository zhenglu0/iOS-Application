//
//  UserDefaultsDemoAppDelegate.m
//  UserDefaultsDemo
//
//  Created by Chris Marcellino on 1/24/10.
//  Copyright Chris Marcellino 2010. All rights reserved.
//

#import "UserDefaultsDemoAppDelegate.h"
#import "MainViewController.h"

@implementation UserDefaultsDemoAppDelegate


@synthesize window;
@synthesize mainViewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
    
	MainViewController *aController = [[MainViewController alloc] initWithNibName:@"MainView" bundle:nil];
	self.mainViewController = aController;
	[aController release];
	
    mainViewController.view.frame = [UIScreen mainScreen].applicationFrame;
	[window addSubview:[mainViewController view]];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [mainViewController release];
    [window release];
    [super dealloc];
}

@end
