//
//  FoundDevicesTableViewController.h
//  BonjourAndStreams
//
//  Created by Alan Cannistraro on 3/2/10.
//  Copyright 2010 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FoundDevicesTableViewController : UITableViewController {

	NSNetServiceBrowser	*_browser;
	NSMutableArray	*_foundServices;
}

@end
