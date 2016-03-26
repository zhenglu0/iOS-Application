//
//  PushAndPopAppDelegate.h
//  PushAndPop
//

#import <UIKit/UIKit.h>

@interface PushAndPopAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

