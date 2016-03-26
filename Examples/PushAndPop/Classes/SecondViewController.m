//
//  SecondViewController.m
//  PushAndPop
//

#import "SecondViewController.h"


@implementation SecondViewController

@synthesize label;
@synthesize text;

- (id)initWithText:(NSString *)someText
{
    if (self = [self initWithNibName:@"SecondView" bundle:nil]) {
        // Custom initialization
        self.title = @"Second";
        self.text = someText;
    }
    return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.label.text = self.text;
}

- (void)dealloc {
    [label release];
    [text release];
    
    [super dealloc];
}


@end
