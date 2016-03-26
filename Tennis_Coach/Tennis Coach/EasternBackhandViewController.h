//
//  EasternBackhandViewController.h
//  Tennis Coach
//
//  Created by 罗铮 on 7/31/12.
//  Copyright (c) 2012 WUSTL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EasternBackhandViewController : UIViewController
{
    IBOutlet UIScrollView *scrollView;
    UIView *containerView;
}

-(void) hideNavBar;
@end
