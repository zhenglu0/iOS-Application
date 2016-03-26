//
//  ScrollAppDelegate.h
//  Scroll
//

#import <UIKit/UIKit.h>

@interface ScrollAppDelegate : NSObject <UIApplicationDelegate, UIScrollViewDelegate> {
    UIWindow *window;
    UIScrollView *scrollView;
    UIView *containerView;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

