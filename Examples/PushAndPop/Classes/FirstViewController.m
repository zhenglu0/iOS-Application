//
//  FirstViewController.m
//  PushAndPop
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@implementation FirstViewController

- (IBAction)push:(id)sender
{
    SecondViewController *secondViewController = [[SecondViewController alloc] initWithText:@"Something"];
    [self.navigationController pushViewController:secondViewController animated:YES];
    [secondViewController release];
}

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
        self.title = @"¡Numero Uno!";
    }
    return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add:)];
    self.navigationItem.rightBarButtonItem = barButtonItem;
    [barButtonItem release];
    
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStyleBordered target:nil action:nil];
    self.navigationItem.backBarButtonItem = backBarButtonItem;
    [backBarButtonItem release];
}

- (void)add:(id)sender
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Nothing to add" message:@"Sorry, try again!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
    [alertView release];
}

@end
