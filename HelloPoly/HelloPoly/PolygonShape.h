//
//  PolygonShape.h
//  WhatATool
//
//  Created by Zheng Luo on 6/23/12.
//  Copyright (c) 2012 Washington University in St.Louis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PolygonShape : NSObject
{
    int numberOfSides;
    int minimumNumberOfSides;
    int maximumNumberOfSides;
    float angleInDegrees;
    float angleInRadians;
    NSString *name;
}

@property (readonly) NSString *name;
@property (nonatomic)int numberOfSides;
@property (nonatomic)int minimumNumberOfSides;
@property (nonatomic)int maximumNumberOfSides;
@property (readonly) float angleInDegrees;
@property (readonly) float angleInRadians;

-(id)initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min maximumNumberOfSides:(int)max;
-(void)description;

@end
