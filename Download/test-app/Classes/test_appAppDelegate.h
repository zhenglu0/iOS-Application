//
//  test_appAppDelegate.h
//  test-app
//
//  Copyright iPhoneDevTips.com All rights reserved.
//

#import <UIKit/UIKit.h>

@class test_appViewController;

@interface test_appAppDelegate : NSObject <UIApplicationDelegate, UIImagePickerControllerDelegate>
{
  UIWindow *window;
  test_appViewController *vc;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) test_appViewController *vc;

@end

