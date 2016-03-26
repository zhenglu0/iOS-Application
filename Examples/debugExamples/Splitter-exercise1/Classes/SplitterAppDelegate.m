//
//  SplitterAppDelegate.m
//  Splitter
//
//  Created by Troy on 4/10/09.
//  Copyright Stanford 2009. All rights reserved.
//

#import "SplitterAppDelegate.h"

@implementation SplitterAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
