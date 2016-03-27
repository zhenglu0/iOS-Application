//
//  Controller.m
//  HelloPoly
//
//  Created by Zheg Luo on 6/24/12.
//  Copyright (c) 2012 WashU. All rights reserved.
//

#import "Controller.h"

@implementation Controller

// set up initial state
- (void)awakeFromNib
{
    [polygon setNumberOfSides:5];
    [polygon setMaximumNumberOfSides:12];
    [polygon setMinimumNumberOfSides:3];
}

-(IBAction)decrease 
{
    // get the value of sides of the polygon
    int polygonSides = [polygon numberOfSides];
    // check the boundary
    if (polygonSides != [polygon minimumNumberOfSides]) {
        // set the value
        [polygon setNumberOfSides:polygonSides - 1];
    }
    // update the value
    [self updateInterface];
}

-(IBAction)increase 
{
    // get the value of sides of the polygon
    int polygonSides = [polygon numberOfSides];
    // check the boundary
    if (polygonSides != [polygon maximumNumberOfSides]) {
        // set the value
        [polygon setNumberOfSides:polygonSides + 1];
    }
    // update the value
    [self updateInterface];
}


- (void)updateInterface 
{
    // set teh text for the lable
    [numberOfSidesLable setText:[NSString stringWithFormat:@"%d", [polygon numberOfSides]]];
    // set the name for polygon
    [polygonName setText:[polygon name]];
    // set angle in degree for polygon
    [angleInDegrees setText:[NSString stringWithFormat:@"%f",[polygon angleInDegrees]]];
    // set angle in radian for polygon
    [angleInRadians setText:[NSString stringWithFormat:@"%f",[polygon angleInRadians]]];
    // set maximum allowable value
    [maximumAllowableValues setText:[NSString stringWithFormat:@"%d", [polygon maximumNumberOfSides]]];
    // set minimum allowable value
    [minimumAllowableValues setText:[NSString stringWithFormat:@"%d", [polygon minimumNumberOfSides]]];
    if ([polygon numberOfSides] == [polygon minimumNumberOfSides]) {
        // the sides is equal to the minimum, disable the decrease button
        [decreaseButton setEnabled:NO];
    } else {
        [decreaseButton setEnabled:YES];
    }
    if (polygon.numberOfSides == polygon.maximumNumberOfSides) {
        // the sides is equal to the maxinum, disable the increase button
        [increaseButton setEnabled:NO];
    } else {
        [increaseButton setEnabled:YES];
    }
}

@end
