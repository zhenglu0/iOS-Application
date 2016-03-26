//
//  UntitledAppDelegate.h
//  Untitled
//
//  Created by Alan Cannistraro on 2/11/10.
//  Copyright Apple 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UntitledAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
    UIWindow *window;
    UITabBarController *tabBarController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@end
