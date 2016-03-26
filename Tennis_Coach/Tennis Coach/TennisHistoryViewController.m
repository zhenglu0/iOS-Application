//
//  TennisHistoryViewController.m
//  Tennis Coach
//
//  Created by 罗铮 on 8/1/12.
//  Copyright (c) 2012 WUSTL. All rights reserved.
//

#import "TennisHistoryViewController.h"

@interface TennisHistoryViewController ()

@end

@implementation TennisHistoryViewController

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
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"Centre_Court.png"]];
    CGRect frame = CGRectMake(0, totalHeight, image.size.width, image.size.height);
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image = image;
    // Add it as a subview of the container view.
    [containerView addSubview:imageView];
    // Increment our maximum width & total height.
    maximumWidth = MAX(maximumWidth, image.size.width);
    totalHeight += image.size.height;
    // Size the container view to fit. Use its size for the scroll view's content size as well.
    CGRect frame2 = CGRectMake(0, totalHeight, image.size.width, image.size.height);
    UITextView *text = [[UITextView alloc]initWithFrame:frame2];
    [text setScrollEnabled:YES];
    [text setText:@"Tennis is a sport usually played between two players (singles) or between two teams of two players each (doubles). Each player uses a racket that is strung to strike a hollow rubber ball covered with felt over a net into the opponent's court. The object of the game is to play the ball in such a way that the opponent is not able to play a good return. Tennis is an Olympic sport and is played at all levels of society at all ages. The sport can be played by anyone who can hold a racket, including people in wheelchairs.\n The modern game of tennis originated in Birmingham, England in the late 19th century as \"lawn tennis\" which has close connections to various field/lawn games as well as to the ancient game of real tennis. Up to then, \"tennis\" referred to the latter sport: for example, in Disraeli's novel Sybil (1845), Lord Eugene De Vere announces that he will \"go down to Hampton Court and play tennis. As it is the Derby [classic horse race], nobody will be there\". After its creation, lawn tennis spread throughout the upper-class English-speaking population before spreading around the world. \n The rules of tennis have not changed much since the 1890s. Two exceptions are that from 1908 to 1961 the server had to keep one foot on the ground at all times, and the adoption of the tie-break in the 1970s. A recent addition to professional tennis has been the adoption of electronic review technology coupled with a point challenge system, which allows a player to challenge the line (or chair) umpire's call of a point. Players have unlimited opportunities to challenge provided the challenges made are correct. However, once three incorrect challenges are made in a set, they cannot challenge again until the next set. If the set goes to a tie-break, players are given one additional opportunity to challenge the call. This electronic review, currently called Hawk-Eye, is available at a limited number of high-level ATP and WTA tournaments. \nTennis is enjoyed by millions of recreational players and is also a hugely popular worldwide spectator sport, especially the four Grand Slam tournaments (also referred to as the \"Majors\"): the Australian Open played on hard courts, the French Open played on red clay courts, Wimbledon played on grass courts, and the US Open played also on hard courts."];
    [containerView addSubview:text];
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
