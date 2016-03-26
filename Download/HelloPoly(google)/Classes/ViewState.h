//
//  ViewState.h
//  HelloPoly
//
//  Created by Remy Porter on 4/12/09.
//  Copyright 2009 JetpackShark.com. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 This class tracks the persistent state data for the view and steps through the animation for us.
 */
@interface ViewState : NSObject {
	NSArray* currentShape;
	float animatedAngle;
	float zoom;
	float animationStep;
}

//Zooming is unimplimented
- (void) zoomIn:(float) amount;
- (void) zoomOut:(float) amount;
- (void) accelerate:(float) amount;
//Advance to the next state.
- (void) step;

//Shape to display
@property (copy) NSArray* currentShape;
//Angle to rotate it by
@property (readonly) float animatedAngle;
//How much to move it betwee frames...
@property (readonly) float animationStep;
@property float zoom;
@end
