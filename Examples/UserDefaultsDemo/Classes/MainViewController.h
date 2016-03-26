//
//  MainViewController.h
//  UserDefaultsDemo
//
//  Created by Chris Marcellino on 1/24/10.
//  Copyright Chris Marcellino 2010. All rights reserved.
//

#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate> {
    UIImageView *imageView;
}

@property (assign) IBOutlet UIImageView *imageView;

- (IBAction)showInfo;

@end
