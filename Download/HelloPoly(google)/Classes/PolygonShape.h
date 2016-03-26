//
//  PolygonShape.h
//  HelloPoly
//
//  Created by Remy Porter on 4/8/09.
//  Copyright 2009 JetpackShark.com. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <math.h>
#import "PolyPoint.h"

//The polygon. This does some basic operations, but it's not really interesting.
//This is the Model in the MVC pattern.
@interface PolygonShape : NSObject {
	int numberOfSides;
	int minimumNumberOfSides;
	int maximumNumberOfSides;
}

- (id) init;
- (id) initWithNumberOfSides:(int)sides minSides:(int)min maxSides:(int)max;
//This is an override of ObjC's equivalent of a ToString method.
- (NSString*) description;

@property (nonatomic)int numberOfSides;
@property (nonatomic)int minimumNumberOfSides;
@property (nonatomic)int maximumNumberOfSides;
@property (readonly) float angleInDegrees;
@property (readonly) float angleInRadians;
@property (readonly) NSString* name;
//This is the one interesting function- this uses some basic trig to generate a set of points to describe a regular polygon.
- (NSArray*) shapeAtSize:(float) size;

@end
