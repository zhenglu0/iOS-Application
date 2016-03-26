//
//  MainViewController.m
//  UserDefaultsDemo
//
//  Created by Chris Marcellino on 1/24/10.
//  Copyright Chris Marcellino 2010. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"


@implementation MainViewController

@synthesize imageView;

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller {
	[self dismissModalViewControllerAnimated:YES];
}

- (IBAction)showInfo {
	FlipsideViewController *controller = [[FlipsideViewController alloc] initWithNibName:@"FlipsideView" bundle:nil];
	controller.delegate = self;
	
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:controller animated:YES];
	
	[controller release];
}

- (void)viewWillAppear:(BOOL)animated {
    // Redraw the color
    [[self view] setNeedsDisplay];
    
    // Update the image alpha
    double imageAlpha = [[NSUserDefaults standardUserDefaults] doubleForKey:@"ImageAlpha"];
    [imageView setAlpha:imageAlpha];
}

@end
