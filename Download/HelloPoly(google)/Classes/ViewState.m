//
//  ViewState.m
//  HelloPoly
//
//  Created by Remy Porter on 4/12/09.
//  Copyright 2009 JetpackShark.com. All rights reserved.
//

#import "ViewState.h"
#define FRICTION_RATE 0.0001 //how much to slow the spin down by between frames.


@implementation ViewState
- (id) init {
	if (self = [super init]) {
		animatedAngle = 0;
		animationStep = 0.03;
		zoom = 1;
	}
	return self;
}
- (void) zoomIn:(float) amount {
	zoom += amount;
}
- (void) zoomOut:(float) amount {
	zoom -= amount;
}
- (void) accelerate:(float) amount {
	animationStep += amount;
}
//On each animation frame, do the spinny stuff.
- (void) step {
	animatedAngle += animationStep;
	if (animationStep > FRICTION_RATE) [self accelerate:-1*FRICTION_RATE];
	else if (animationStep < -1*FRICTION_RATE) [self accelerate:FRICTION_RATE];
}

@synthesize currentShape;
@synthesize animatedAngle;
@synthesize animationStep;
@synthesize zoom;

@end
