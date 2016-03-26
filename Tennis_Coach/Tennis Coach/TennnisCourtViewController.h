//
//  TennnisCourtViewController.h
//  Tennis Coach
//
//  Created by 罗铮 on 8/1/12.
//  Copyright (c) 2012 WUSTL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TennnisCourtViewController : UIViewController
{
    IBOutlet UIScrollView *scrollView;
    UIView *containerView;
}

-(void) hideNavBar;
@end
