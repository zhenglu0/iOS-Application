//
//  PolyView.h
//  HelloPoly
//
//  Created by Remy Porter on 4/8/09.
//  Copyright 2009 JetpackShark.com. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <UIKit/UIView.h>
#import <Foundation/Foundation.h>
//#import <Foundation/NSGeometry.h>
#import "PolygonShape.h"
#import "ViewState.h"

/*
 The custom designed view. This class actually has the lion's share of the code just because the view and its behavior is pretty complex.
 Note, while the view is a heavy class, this is still MVC- it's just a very complex V.
 
 The PolyView is responsible for displaying the regular polygon currently selected by the slider. It supports animation and swipes.
 */
@interface PolyView : UIView {
    IBOutlet PolygonShape *polyModel; //A link to the model.
	NSTimer* viewClock; //A timer for animation updates.
	ViewState* state; //There's a lot of stuff to track, so let's use a ViewState class to track all the details.
	CGPoint touchStart; //I like to remember where I was first touched.
}
//A wrapper around setNeedsDisplay as an IBAction- this makes it usable in the Interface Builder
- (IBAction)repaint:(id)sender;
//A notification that the selected shape has changed. Triggers a redraw.
- (IBAction)shapeChanged:(id)sender;
//The animation loop function
- (void)tickOver:(NSTimer*) t;
//A method to handle the nasty bits of rendering the polygon.
- (void) renderPolygon:(NSArray*)p inContext:(CGContextRef)c;
@end
