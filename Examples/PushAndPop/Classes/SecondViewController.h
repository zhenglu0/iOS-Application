//
//  SecondViewController.h
//  PushAndPop
//

#import <UIKit/UIKit.h>


@interface SecondViewController : UIViewController {
    UILabel *label;
    NSString *text;
}

- (id)initWithText:(NSString *)text;

@property (retain) IBOutlet UILabel *label;
@property (retain) NSString *text;
@end
