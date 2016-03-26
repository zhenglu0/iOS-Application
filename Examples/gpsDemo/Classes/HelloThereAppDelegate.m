//
//  HelloThereAppDelegate.m
//  HelloThere
//
//  Created by Dan Grigsby on 2/4/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "HelloThereAppDelegate.h"
#import "HelloThereViewController.h"

@implementation HelloThereAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
