//
//  BigBuckBunnyAppDelegate.h
//  BigBuckBunny

#import <UIKit/UIKit.h>

@class BigBuckBunnyViewController;

@interface BigBuckBunnyAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    BigBuckBunnyViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet BigBuckBunnyViewController *viewController;

@end

