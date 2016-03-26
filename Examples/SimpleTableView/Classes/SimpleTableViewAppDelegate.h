//
//  SimpleTableViewAppDelegate.h
//  SimpleTableView
//
//  Created by todd on 3/15/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnotherTableView.h"

@interface SimpleTableViewAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	AnotherTableView *myTableView;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

