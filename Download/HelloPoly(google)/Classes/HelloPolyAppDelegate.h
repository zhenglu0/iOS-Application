//
//  HelloPolyAppDelegate.h
//  HelloPoly
//
//  Created by Remy Porter on 4/8/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HelloPolyViewController;

@interface HelloPolyAppDelegate : NSObject <UIApplicationDelegate> {
	IBOutlet UIWindow *window;
}

@property (nonatomic, retain) UIWindow *window;

@end

