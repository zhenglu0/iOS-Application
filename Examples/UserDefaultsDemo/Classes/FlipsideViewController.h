//
//  FlipsideViewController.h
//  UserDefaultsDemo
//
//  Created by Chris Marcellino on 1/24/10.
//  Copyright Chris Marcellino 2010. All rights reserved.
//

@protocol FlipsideViewControllerDelegate;


@interface FlipsideViewController : UIViewController {
	id <FlipsideViewControllerDelegate> delegate;
    UISwitch *colorSwitch;
}

@property (assign) id <FlipsideViewControllerDelegate> delegate;
@property (assign) IBOutlet UISwitch *colorSwitch;
- (IBAction)changeColors;
- (IBAction)done;

@end


@protocol FlipsideViewControllerDelegate

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;

@end

