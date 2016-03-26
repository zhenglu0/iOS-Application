//
//  MyTableViewAppDelegate.h
//  MyTableView
//

#import <UIKit/UIKit.h>

@class MyTableViewController;

@interface MyTableViewAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MyTableViewController *myTableViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

