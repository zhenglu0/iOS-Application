//
//  LetsMakeAThreadAppDelegate.h
//  LetsMakeAThread
//
//  Created by Evan Doll on 10/27/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LetsMakeAThreadAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    
    UIActivityIndicatorView *spinner;
    UILabel *answerLabel;
    UIButton *button;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *spinner;
@property (nonatomic, retain) IBOutlet UILabel *answerLabel;
@property (nonatomic, retain) IBOutlet UIButton *button;

- (IBAction)beginDeepThought:(id)sender;

@end

