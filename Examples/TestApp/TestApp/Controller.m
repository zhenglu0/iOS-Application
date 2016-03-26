//
//  Controller.m
//  TestApp
//
//  Created by todd on 8/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Controller.h"


@implementation Controller

-(IBAction) slideMe {
 
    myLabel.text = [NSString stringWithFormat:@"%1.2f",mySlider.value];
    
    
}

@end
