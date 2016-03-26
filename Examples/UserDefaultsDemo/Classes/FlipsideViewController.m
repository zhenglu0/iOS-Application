//
//  FlipsideViewController.m
//  UserDefaultsDemo
//
//  Created by Chris Marcellino on 1/24/10.
//  Copyright Chris Marcellino 2010. All rights reserved.
//

#import "FlipsideViewController.h"


@implementation FlipsideViewController

@synthesize delegate, colorSwitch;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor viewFlipsideBackgroundColor];      
}

- (void)viewWillAppear:(BOOL)animated {
    BOOL value = [[NSUserDefaults standardUserDefaults] boolForKey:@"UseRedColor"];
    colorSwitch.on = value;
}

- (IBAction)changeColors {
    BOOL value = colorSwitch.on;
    [[NSUserDefaults standardUserDefaults] setBool:value forKey:@"UseRedColor"];
    
    // call synchronize to save changes to disk now
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (IBAction)done {
	[self.delegate flipsideViewControllerDidFinish:self];	
}

@end
