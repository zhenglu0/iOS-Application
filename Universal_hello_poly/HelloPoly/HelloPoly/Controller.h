//
//  Controller.h
//  HelloPoly
//
//  Created by Zheg Luo on 6/24/12.
//  Copyright (c) 2012 WashU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PolygonShape.h"

@interface Controller : NSObject
{
    IBOutlet UIButton *decreaseButton;
    IBOutlet UIButton *increaseButton;
    IBOutlet UILabel *numberOfSidesLable;
    IBOutlet UILabel *angleInDegrees;
    IBOutlet UILabel *angleInRadians;
    IBOutlet UILabel *minimumAllowableValues; 
    IBOutlet UILabel *maximumAllowableValues;
    IBOutlet UILabel *polygonName;
    IBOutlet PolygonShape *polygon;
}

- (IBAction) decrease;
- (IBAction) increase;

- (void)updateInterface;


@end
