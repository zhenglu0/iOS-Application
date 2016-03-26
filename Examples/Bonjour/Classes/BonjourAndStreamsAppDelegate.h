//
//  BonjourAndStreamsAppDelegate.h
//  BonjourAndStreams
//
//  Created by Alan Cannistraro on 3/2/10.
//  Copyright Apple 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ReceiveServer;

@interface BonjourAndStreamsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	IBOutlet UINavigationController	*nav;
	
	ReceiveServer	*receiveServer;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

