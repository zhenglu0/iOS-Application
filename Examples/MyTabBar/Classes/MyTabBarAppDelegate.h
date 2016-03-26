//
//  MyTabBarAppDelegate.h
//  MyTabBar
//
//  Created by Evan Doll on 10/16/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyViewController.h"

@interface MyTabBarAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    UITabBarController *tabBarController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

