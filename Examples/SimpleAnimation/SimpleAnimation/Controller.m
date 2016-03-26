//
//  Controller.m
//  SimpleAnimation
//
//  Created by todd on 9/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Controller.h"


@implementation Controller

-(IBAction) useSwitch {

    
    [UIView beginAnimations:@"advancedAnimations"context:nil]; 
    [UIView setAnimationDuration:.3];

    CGRect polygonFrame = myImage.frame;
    
    if([mySwitch isOn]){
        polygonFrame.size.height -= 50;
 //       polygonFrame.origin.y -= 50;
    } else {
        polygonFrame.size.height += 50;
    }
    
    myImage.frame = polygonFrame;
    
    [UIView commitAnimations];

    
}

@end
