//
//  ViewController.m
//  MoviePlayer
//
//  Created by 铮 罗 on 7/22/12.
//  Copyright (c) 2012 四川大学. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(IBAction)playMovie:(id)sender
{
	//UIButton *playButton = (UIButton *) sender; 
    moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:fileURL];
    // get the screen size
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat hight = [UIScreen mainScreen].bounds.size.height;
	[moviePlayerController.view setFrame:CGRectMake((width-hight/2)/2, 
													3*hight/4-width/2, 
													hight/2, 
													width)];
    [[moviePlayerController view] setTransform:CGAffineTransformMakeRotation(M_PI/2)];
    
	[self.view addSubview:moviePlayerController.view];	
	moviePlayerController.scalingMode = MPMovieScalingModeFill;
    [moviePlayerController play];
}


-(IBAction)chooseVideo:(id)sender
{
    UIImagePickerController *imagePicker =
    [[UIImagePickerController alloc] init];
    
    imagePicker.delegate = (id)self;
    
    imagePicker.sourceType = 
    UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.mediaTypes = [NSArray arrayWithObjects:
                              (NSString *) kUTTypeMovie, nil];
    
    [self presentModalViewController:imagePicker animated:YES];
}

-(void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
	// Code here to work with media
    fileURL = [info objectForKey:UIImagePickerControllerMediaURL];
    NSLog(@"%@",fileURL);
    [self dismissModalViewControllerAnimated:YES];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissModalViewControllerAnimated:YES];
}


- (void)viewDidLoad
{    
    [super viewDidLoad];
    scrollView.delegate = (id) self;
    scrollView.bouncesZoom = YES;
    
    // Create a container view. We need to return this in -viewForZoomingInScrollView: below.
    containerView = [[UIView alloc] initWithFrame:CGRectZero];
    [scrollView addSubview:containerView];
        
    // Create an image view for each of our images
    CGFloat maximumWidth = 0.0;
    CGFloat totalHeight = 0.0;

    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"Federer_Forehand2.png"]];
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

/*
-(void) scrollViewDidEndScrollingAnimation {

    NSLog(@"in scroll end");
}

 - (void)scrollViewDidScroll:(UIScrollView *)scrollView {
 
 NSLog(@"start scroll");
 
 }
*/

-(void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
    
    NSLog(@"In touch began");
    
}

-(void) touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event {
    
    NSLog(@"In touch end");
    
}

// Implement the UIScrollView delegate method so that it knows which view to scale when zooming.
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    
    return containerView;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIDeviceOrientationPortrait);
}

@end
