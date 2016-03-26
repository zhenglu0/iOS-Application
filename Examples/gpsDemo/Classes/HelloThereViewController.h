#import <UIKit/UIKit.h>
#import "MyCLController.h"

@interface HelloThereViewController : UIViewController <MyCLControllerDelegate> {
	IBOutlet UILabel *locationLabel;
	MyCLController *locationController;
}

- (void)locationUpdate:(CLLocation *)location; 
- (void)locationError:(NSError *)error;

@end