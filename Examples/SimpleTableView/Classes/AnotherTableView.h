//
//  AnotherTableView.h
//  MoreLab4
//
//  Created by todd on 3/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AnotherTableView : UITableViewController {
	NSMutableArray *names;
}

- (void) loadDatabase;

@end
