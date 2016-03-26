//
//  CoolVCAppDelegate.h
//  CoolVC
//
//  Created by todd on 9/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoolVCAppDelegate : NSObject <UIApplicationDelegate> {
    UINavigationController *myNav;

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end
