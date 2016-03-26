//
//  ViewController.h
//  MoviePlayer
//
//  Created by 铮 罗 on 7/22/12.
//  Copyright (c) 2012 四川大学. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>  
#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController : UIViewController
{
    MPMoviePlayerController *moviePlayerController;
    IBOutlet UIScrollView *scrollView;
    UIView *containerView;
    NSURL *fileURL;
}
-(IBAction)playMovie:(id)sender;
-(IBAction)chooseVideo:(id)sender;

@end
