//
//  BigBuckBunnyViewController.m
//  BigBuckBunny

#import "BigBuckBunnyViewController.h"

@implementation BigBuckBunnyViewController

-(IBAction)playMovie:(id)sender
{
	UIButton *playButton = (UIButton *) sender; 
	
    NSString *filepath   =   [[NSBundle mainBundle] pathForResource:@"big-buck-bunny-clip" ofType:@"m4v"];
    NSURL    *fileURL    =   [NSURL fileURLWithPath:filepath];
    MPMoviePlayerController *moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:fileURL];
	
    [[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(moviePlaybackComplete:)
												 name:MPMoviePlayerPlaybackDidFinishNotification
											   object:moviePlayerController];
	
	[moviePlayerController.view setFrame:CGRectMake(playButton.frame.origin.x, 
													playButton.frame.origin.y, 
													playButton.frame.size.width, 
													playButton.frame.size.height)];
    
	[self.view addSubview:moviePlayerController.view];
    //moviePlayerController.fullscreen = YES;
	
	//moviePlayerController.scalingMode = MPMovieScalingModeFill;
    [moviePlayerController play];

}

- (void)moviePlaybackComplete:(NSNotification *)notification
{
    MPMoviePlayerController *moviePlayerController = [notification object];
    [[NSNotificationCenter defaultCenter] removeObserver:self
													name:MPMoviePlayerPlaybackDidFinishNotification
												  object:moviePlayerController];
	
    [moviePlayerController.view removeFromSuperview];
    [moviePlayerController release];
}

- (void)dealloc {
    [super dealloc];
}

@end
