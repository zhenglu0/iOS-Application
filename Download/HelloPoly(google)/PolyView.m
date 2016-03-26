//
//  PolyView.m
//  HelloPoly
//
//  Created by Remy Porter on 4/8/09.
//  Copyright 2009 JetpackShark.com. All rights reserved.
//

#import "PolyView.h"

//Constants for swiping
#define INLINE_MIN 16 //minimum distance before we start counting it as a swipe
#define OUTLINE_MAX 6 //maximum distance on the other axis that we'll allow before we say it's no longer a swipe.
#define BASE_ACCEL 0.004 //the acceleration due to swiping

//Animation constants
#define ANI_LOOP_TIME 0.03 

//Shape constants
#define DEFAULT_SIZE 60

@implementation PolyView

/////////// Management Code ///////////////
//Set everything up, including the animation loop
- (void) awakeFromNib { 
	state = [[ViewState alloc] init]; //get a view state object
	viewClock = [NSTimer scheduledTimerWithTimeInterval:ANI_LOOP_TIME target:self selector:@selector(tickOver:) userInfo:nil repeats:YES]; //set up the animation loop
	[viewClock retain]; //that was a factory method, so call retain so it doesn't get thrown away
	[self shapeChanged:self]; //and notify ourselves that the shape changed the first tie
}

//Animation loop
- (void) tickOver:(NSTimer*)t {
	[state step]; //step the viewstate once
	[self setNeedsDisplay]; //refresh the screen
}

- (IBAction)repaint:(id)sender {
	[self setNeedsDisplay];
}

//The shape has been changed
- (IBAction)shapeChanged:(id)sender {
	state.currentShape = [polyModel shapeAtSize:DEFAULT_SIZE]; //get the currently active polygon and its coordinates and put it in our state.
	[self setNeedsDisplay]; //refresh
}
/////////////////// Rendering Code /////////////////////

//This is an override of a UIView method - this is our render method.
//We're being bad and not supporting partial refreshes, and I don't care.
- (void) drawRect:(CGRect) rect {
	CGContextRef c = UIGraphicsGetCurrentContext(); //Get the drawing area
	CGContextSetRGBStrokeColor(c, 0, 0, 0, 1.0);	//Set the stroke
	CGContextSetRGBFillColor(c, 0.5, 0.5,1, 1.0);	//and fill
	CGContextSetLineWidth(c,5);						//and line width
	//Now, transform the shape- move it to the center of the view and rotate it.
	CGContextTranslateCTM(c, (CGFloat) self.bounds.size.width/2, (CGFloat) self.bounds.size.height/2);
	CGContextRotateCTM(c, state.animatedAngle);

	//Finally, draw it.
	[self renderPolygon:state.currentShape inContext:c];
	
	//It spins, so put it on an axle. 
	CGContextSetLineWidth(c,2); 
	CGContextSetRGBFillColor(c, 0.8, 0.1, 0.8, 0.8); //change colors
	CGRect center = CGRectMake(-2, -2, 4, 4); //make a rectangle- note, we've already done a translation, so I'm centering it around the origin.
	CGContextFillEllipseInRect(c, center); //Fill the rectangle with an ellipse.
     
}

//Given an array of points, render them as a polygon.
- (void) renderPolygon:(NSArray*)p inContext:(CGContextRef)c {
	BOOL first = YES;
	for (PolyPoint* point in p) {
		if (first) { //To start a Path, I have to "MoveToPoint".
			CGContextMoveToPoint(c, point.point.x, point.point.y);
			first = NO;
		} else { //After that, though, I just AddLineToPoint.
			CGContextAddLineToPoint(c, point.point.x, point.point.y);
		}
	}
	CGContextClosePath(c); //To make it fillable, I close it.
	CGContextDrawPath(c, kCGPathFillStroke);	
}


//////////////// Touching Code ///////////////////////
//There are some event handlers for UIViews that handle touch events. I've overridden two of them.

//When a touch begins, note where it starts.
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch* t = [touches anyObject];
	touchStart = [t locationInView:self];
}

//As the touch moves across the screen, this event will watch it.
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch* t = [touches anyObject];
	CGPoint touchCurrent = [t locationInView:self]; //Keep tabs on where it is
	if (fabsf(touchStart.x - touchCurrent.x) >= INLINE_MIN && fabsf(touchStart.y - touchCurrent.y) <= OUTLINE_MAX) { //horizontal swipe
		float dirMult = (touchStart.x < touchCurrent.x)?1:-1; //if we're moving from left to right, do nothing, but if it's right to left, multiply by -1
		float areaMult = (touchStart.y <= self.bounds.size.height /2)?1:-1; //if I'm at the top of the screen, do nothing, but at the bottom, multiply by -1
		[state accelerate:BASE_ACCEL*dirMult*areaMult]; //and accelerate by that amount.
	} else if (fabsf(touchStart.y - touchCurrent.y) >= INLINE_MIN && fabsf(touchStart.x - touchCurrent.x) <= OUTLINE_MAX) { //vertical swipe - same as horizontal, but swap the axes
		float dirMult = (touchStart.y > touchCurrent.y)?1:-1;
		float areaMult = (touchStart.x <= self.bounds.size.width /2)?1:-1;
		[state accelerate:BASE_ACCEL*dirMult*areaMult];
	}
}

@end
