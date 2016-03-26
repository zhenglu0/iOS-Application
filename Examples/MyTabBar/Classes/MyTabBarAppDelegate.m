//
//  MyTabBarAppDelegate.m
//  MyTabBar
//
//  Created by Evan Doll on 10/16/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import "MyTabBarAppDelegate.h"


@implementation MyTabBarAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    tabBarController = [[UITabBarController alloc] init];
    
    // Create a few view controllers
    UIViewController *redViewController = [[UIViewController alloc] init];
    redViewController.title = @"Red";
    redViewController.tabBarItem.image = [UIImage imageNamed:@"faves.png"];
    redViewController.view.backgroundColor = [UIColor redColor];

    UIViewController *blueViewController = [[UIViewController alloc] init];
    blueViewController.title = @"Blue";
    blueViewController.tabBarItem.image = [UIImage imageNamed:@"search.png"];
    blueViewController.view.backgroundColor = [UIColor blueColor];
    
    UIViewController *gradViewController = [[UIViewController alloc] init];
    gradViewController.title = @"Poly";
    gradViewController.tabBarItem.image = [UIImage imageNamed:@"gradhat.png"];
    gradViewController.view.backgroundColor = [UIColor yellowColor];

    UIViewController *polyViewController = [[UIViewController alloc] init];
    polyViewController.title = @"Poly";
    polyViewController.tabBarItem.image = [UIImage imageNamed:@"gradhat.png"];
    polyViewController.view.backgroundColor = [UIColor yellowColor];
    
    UIViewController *noteViewController = [[UIViewController alloc] init];
    [noteViewController setTitle:@"Note"];
    [[noteViewController tabBarItem] setImage:[UIImage imageNamed:@"note.png"]];
    [[noteViewController view] setBackgroundColor:[UIColor purpleColor]];
    
    
    UIViewController *noteViewController2 = [[UIViewController alloc] init];
    [noteViewController2 setTitle:@"Note"];
    noteViewController2.tabBarItem.image = [UIImage imageNamed:@"note.png"];
    noteViewController2.view.backgroundColor = [UIColor purpleColor];
    
    MyViewController *myViewController = [[MyViewController alloc] initWithNibName:@"MyView" bundle:nil];
    
    // Add them as children of the tab bar controller
    tabBarController.viewControllers = [NSArray arrayWithObjects:redViewController, blueViewController,polyViewController, myViewController,noteViewController,noteViewController2, nil];

    // Don't forget memory management
    [redViewController release];
    [blueViewController release];
    [myViewController release];
    
    // Add the tab bar controller's view to the window
    [window addSubview:[tabBarController view]];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [tabBarController release];
    [window release];
    [super dealloc];
}


@end
