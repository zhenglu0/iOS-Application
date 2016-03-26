//
//  SemiWesternForhandViewController.h
//  Tennis Coach
//
//  Created by 罗铮 on 7/30/12.
//  Copyright (c) 2012 WUSTL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SemiWesternForhandViewController : UIViewController
{
    IBOutlet UIScrollView *scrollView;
    UIView *containerView;
}

-(void) hideNavBar;

@end
