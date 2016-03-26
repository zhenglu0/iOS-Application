//
//  TennnisCourtViewController.m
//  Tennis Coach
//
//  Created by 罗铮 on 8/1/12.
//  Copyright (c) 2012 WUSTL. All rights reserved.
//

#import "TennnisCourtViewController.h"

@interface TennnisCourtViewController ()

@end

@implementation TennnisCourtViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // set the scroll view
    scrollView.delegate = (id) self;
    scrollView.bouncesZoom = YES;
    // Create a container view. We need to return this in -viewForZoomingInScrollView: below.
    containerView = [[UIView alloc] initWithFrame:CGRectZero];
    [scrollView addSubview:containerView];
    // Create an image view for each of our images
    CGFloat maximumWidth = 0.0;
    CGFloat totalHeight = 0.0;
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"Tennis-Court-Diagram.png"]];
    CGRect frame = CGRectMake(0, totalHeight, image.size.width, image.size.height);
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image = image;
    // Add it as a subview of the container view.
    [containerView addSubview:imageView];
    // Increment our maximum width & total height.
    maximumWidth = MAX(maximumWidth, image.size.width);
    totalHeight += image.size.height;
    // Size the container view to fit. Use its size for the scroll view's content size as well.
    containerView.frame = CGRectMake(0, 0, maximumWidth, totalHeight);
    scrollView.contentSize = containerView.frame.size;
    // Minimum and maximum zoom scales
    scrollView.minimumZoomScale = scrollView.frame.size.width / maximumWidth;
    scrollView.maximumZoomScale = 2.0;
}

// Implement the UIScrollView delegate method so that it knows which view to scale when zooming.
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return containerView;
}

// set the navigation bar not hidden
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
}

// set the navigation bar hidden
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    [self performSelector:@selector(hideNavBar) withObject:nil afterDelay:1];
}

-(void) hideNavBar {
    if (self.navigationController.navigationBar.hidden == NO)
    {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
