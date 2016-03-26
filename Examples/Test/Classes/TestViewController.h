//
//  TestViewController.h
//  Test
//
//  Created by todd on 2/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestViewController : UIViewController {

	int count;
	IBOutlet UILabel *label;
}

-(IBAction) buttonPushed;

@end

