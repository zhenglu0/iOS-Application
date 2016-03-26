//
//  CompareVolleyViewController.h
//  Tennis Coach
//
//  Created by 罗铮 on 8/1/12.
//  Copyright (c) 2012 WUSTL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface CompareVolleyViewController : UIViewController
{
    MPMoviePlayerController *moviePlayerController;
    IBOutlet UIScrollView *scrollView;
    UIView *containerView;
    NSURL *fileURL;
    // used to store the touch time
    int i;
}

-(IBAction)playMovie:(id)sender;
-(IBAction)chooseVideo:(id)sender;

@end
