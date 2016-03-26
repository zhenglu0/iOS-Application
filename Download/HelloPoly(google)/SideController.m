//
//  SideController.m
//  HelloPoly
//
//  Created by Remy Porter on 4/8/09.
//  Copyright 2009 JetpackShark.com. All rights reserved.
//
#import "SideController.h"

@implementation SideController
/* Initialization code */
- (void) awakeFromNib {
	[slider setValue:4 animated: YES];
	[self sliderChanged];
}

/* 
 The core event that the controller cares about is the SliderChanged event- 
 when that happens, it updates the model and notifies the view.
 */
- (IBAction)sliderChanged {
	//Get the view state...
    sideDisplay.text = [NSString stringWithFormat:@"%i",(int)slider.value]; //Display the state
	poly.numberOfSides = (int)slider.value; //update the model
	//Update the view based on our model...
	nameDisplay.text = poly.name;
	degDisplay.text = [NSString stringWithFormat:@"%5.0fº",poly.angleInDegrees];
	radDisplay.text = [NSString stringWithFormat:@"%5.2fπ",poly.angleInRadians/M_PI];
	[polyDisplay shapeChanged:self]; //especially notify the custom view!
}
@end
