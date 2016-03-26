//
//  ScrollAppDelegate.m
//  Scroll
//

#import "ScrollAppDelegate.h"

@implementation ScrollAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Create a scroll view
    scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    scrollView.delegate = self;
    scrollView.bouncesZoom = YES;
    scrollView.backgroundColor = [UIColor blackColor];

    // Create a container view. We need to return this in -viewForZoomingInScrollView: below.
    containerView = [[UIView alloc] initWithFrame:CGRectZero];
    [scrollView addSubview:containerView];
    
    // Create an image view for each of our images
    CGFloat maximumWidth = 0.0;
    CGFloat totalHeight = 0.0;
    for (int i = 1; i <= 2; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg", i]];
        CGRect frame = CGRectMake(0, totalHeight, image.size.width, image.size.height);
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
        imageView.image = image;
        
        // Add it as a subview of the container view.
        [containerView addSubview:imageView];
        [imageView release];
        
        // Increment our maximum width & total height.
        maximumWidth = MAX(maximumWidth, image.size.width);
        totalHeight += image.size.height;
    }
    
    // Size the container view to fit. Use its size for the scroll view's content size as well.
    containerView.frame = CGRectMake(0, 0, maximumWidth, totalHeight);
    scrollView.contentSize = containerView.frame.size;
    
//    // Minimum and maximum zoom scales
    scrollView.minimumZoomScale = scrollView.frame.size.width / maximumWidth;
    scrollView.maximumZoomScale = 2.0;
    
    [window addSubview:scrollView];
    [window makeKeyAndVisible];
}

// Implement the UIScrollView delegate method so that it knows which view to scale when zooming.
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return containerView;
}

- (void)dealloc {
    [scrollView release];
    [containerView release];
    [window release];
    [super dealloc];
}


@end
