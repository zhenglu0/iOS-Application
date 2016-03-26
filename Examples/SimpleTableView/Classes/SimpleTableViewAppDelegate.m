//
//  SimpleTableViewAppDelegate.m
//  SimpleTableView
//
//  Created by todd on 3/15/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "SimpleTableViewAppDelegate.h"

@implementation SimpleTableViewAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
	myTableView = [[AnotherTableView alloc] initWithStyle:UITableViewStylePlain];
	[window addSubview:myTableView.view];
	
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
