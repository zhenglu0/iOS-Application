//
//  MyTableViewAppDelegate.m
//  MyTableView
//

#import "MyTableViewAppDelegate.h"
#import "MyTableViewController.h"

@implementation MyTableViewAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    myTableViewController = [[MyTableViewController alloc] initWithStyle:UITableViewStylePlain];
    myTableViewController.view.frame = [UIScreen mainScreen].applicationFrame;
    
    [window addSubview:myTableViewController.view];
    
    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [myTableViewController release];
    [window release];
    [super dealloc];
}


@end
