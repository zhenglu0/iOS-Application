//
//  SideController.h
//  HelloPoly
//
//  Created by Remy Porter on 4/8/09.
//  Copyright 2009 JetpackShark.com. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PolygonShape.h"
#import "PolyView.h"
#import <math.h>

/*
 Class: SideController
 This here is the brains of the operation. SideController ties together the UI controls and the custom view and governs the model. Classic MVC.
 */
@interface SideController : NSObject {
    IBOutlet UILabel *sideDisplay;
    IBOutlet UISlider *slider;
	IBOutlet UILabel *nameDisplay;
	IBOutlet UILabel *degDisplay;
	IBOutlet UILabel *radDisplay;
	IBOutlet PolygonShape* poly;
	IBOutlet PolyView* polyDisplay;
}
/* 
 The core event that the controller cares about is the SliderChanged event- 
 when that happens, it updates the model and notifies the view.
 */
- (IBAction)sliderChanged;
@end
