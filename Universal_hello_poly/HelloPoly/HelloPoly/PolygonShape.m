//
//  PolygonShape.m
//  WhatATool
//
//  Created by Zheng Luo on 6/19/12.
//  Copyright (c) 2012 Washington University in St.Louis. All rights reserved.
//

#import "PolygonShape.h"

@implementation PolygonShape

@synthesize numberOfSides;
@synthesize minimumNumberOfSides;
@synthesize maximumNumberOfSides;

-(void)setNumberOfSides:(int)numberOfSides_ 
{
    if (numberOfSides_ > maximumNumberOfSides) {
        NSLog(@"Invalid number of sides: %d is greater than the maximum of %d allowed",numberOfSides_,maximumNumberOfSides);
    } else if (numberOfSides_ < minimumNumberOfSides){
    NSLog(@"Invalid number of sides: %d is less than the minimum of %d allowed",numberOfSides_,minimumNumberOfSides);
    } else {
        numberOfSides = numberOfSides_;
    }
}

-(void)setMinimumNumberOfSides:(int)minimumNumberOfSides_ 
{
    if (minimumNumberOfSides_ < 2) {
        NSLog(@"The minimun number of sides must be greater than 2.");
    } else {
        minimumNumberOfSides = minimumNumberOfSides_;
    }
}

-(void)setMaximumNumberOfSides:(int)maximumNumberOfSides_ 
{
    if (maximumNumberOfSides_ > 12) {
        NSLog(@"The maximum number of sides must be less or equal than 12.");
    } else {
        maximumNumberOfSides = maximumNumberOfSides_;
    }
}

//custom initializer method  with constrains
-(id)initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min maximumNumberOfSides:(int)max 
{
    numberOfSides = sides;
    minimumNumberOfSides = min;
    maximumNumberOfSides = max;
    return self;
}

//call the initializer with	default values
-(id)init 
{
    return [self initWithNumberOfSides:5 minimumNumberOfSides:3 maximumNumberOfSides:10];
}

// get the angle in degrees
-(float)angleInDegrees 
{
    return (180 * (numberOfSides - 2) / numberOfSides);
}

// get the angle in Radians
-(float)angleInRadians 
{
    return (((180 * (numberOfSides - 2) / numberOfSides)* M_PI)/180);
}

// get the name of the poligon
-(NSString *)name
{
    NSArray *polygonNames = [NSArray arrayWithObjects:@"Null", @"Null", @"Null", @"Triangle", @"Square", @"Pentagon", @"Hexagon", @"Heptagon", @"Octagon", @"Nonagon", @"Decagone", @"Hendecagon", @"Dodecagon", nil];
    return [polygonNames objectAtIndex:numberOfSides];
}

//the description method
-(void)description
{
    NSLog(@"Hello I am a %d-sided polygon (aka a %@) with angles of %f degrees (%f radians).",[self numberOfSides],[self name],[self angleInDegrees],[self angleInRadians]);
}

@end
