//
//  PolygonShape.m
//  HelloPoly
//
//  Created by Remy Porter on 4/8/09.
//  Copyright 2009 JetpackShark.com. All rights reserved.
//

#import "PolygonShape.h"


@implementation PolygonShape

- (id) init {
	return [self initWithNumberOfSides:4 minSides:2 maxSides:12];
}
- (id) initWithNumberOfSides:(int)sides minSides:(int)min maxSides:(int)max {
	numberOfSides = sides; minimumNumberOfSides = min; maximumNumberOfSides = max;
	return self;
}

	@synthesize numberOfSides;
	@synthesize minimumNumberOfSides;
	@synthesize maximumNumberOfSides;

- (void) setNumberOfSides:(int)nos {
	if (nos >= minimumNumberOfSides && nos <= maximumNumberOfSides)
		numberOfSides = nos;
	else
		NSLog(@"%i sides out of range. Must be between %i and %i", nos, minimumNumberOfSides, maximumNumberOfSides);
}

- (void) setMinimumNumberOfSides:(int)min {
	if (min >= 2 && min < maximumNumberOfSides) 
		minimumNumberOfSides = min;
	else
		NSLog(@"%i is an invalid minimum. May not be less than two and must be less than %i", min, maximumNumberOfSides);
}

- (void) setMaximumNumberOfSides:(int)max {
	if (max > minimumNumberOfSides && max <= 12)
		maximumNumberOfSides = max;
	else
		NSLog(@"%i is an invalid maximum. Must be less that twelve and may not be less than %i", max, minimumNumberOfSides);
}

- (float) angleInDegrees {
	return 180*(numberOfSides - 2)/numberOfSides;
}

- (float) angleInRadians {
	return M_PI*(numberOfSides - 2)/numberOfSides;
}

- (NSString*) name {
	switch(numberOfSides) {
		case 2: return @"line"; break;
		case 3: return @"triangle";break;
		case 4: return @"square";break;
		case 5: return @"pentagon";break;
		case 6: return @"hexagon"; break;
		case 7: return @"septagon"; break;
		case 8: return @"octagon"; break;
		case 9: return @"nonagon"; break;
		case 10: return @"decagon"; break;
		case 11: return @"hendecagon"; break;
		case 12: return @"dodecagon"; break;
	}
	return @"WTF";
}

- (NSArray*) shapeAtSize:(float)size {
	PolyPoint* nextCoord;
	NSMutableArray* shape = [NSMutableArray arrayWithCapacity:numberOfSides];
	for (int i = 0; i < numberOfSides; i++) {
		nextCoord = [[PolyPoint alloc] init];
		nextCoord.x = cosf(i * 2 * M_PI / numberOfSides) * size; //we're sweeping through a circle and subdividing it by the number of sides.
		nextCoord.y = sinf(i * 2 * M_PI / numberOfSides) * size;
		[shape addObject:nextCoord];
	}
	return shape;
}

- (NSString*) description {
	return [NSString stringWithFormat:@"I am a %@, with %i sides, and my internal angles are %5.2f degrees (that's %5.2f radians)",self.name,self.numberOfSides,self.angleInDegrees,self.angleInRadians];
}


@end