//
//  PushAndPopAppDelegate.m
//  PushAndPop
//

#import "PushAndPopAppDelegate.h"
#import "FirstViewController.h"

@implementation PushAndPopAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
    
    navigationController = [[UINavigationController alloc] init];
    [window addSubview:navigationController.view];
    
    FirstViewController *viewController = [[FirstViewController alloc] initWithNibName:@"FirstView" bundle:nil];
    [navigationController pushViewController:viewController animated:NO];
    [viewController release];
    
    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [navigationController release];
    [window release];
    [super dealloc];
}


@end
