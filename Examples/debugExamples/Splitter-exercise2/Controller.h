#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface Controller : NSObject 
{
    IBOutlet UITableView *tableView;
    IBOutlet UITextField *textField;
    
    NSArray *words;
}

@property (retain) NSArray *words;

- (IBAction)splitString;
@end
