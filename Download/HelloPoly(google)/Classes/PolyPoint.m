//
//  PolyPoint.m
//  HelloPoly
//
//  Created by Remy Porter on 4/9/09.
//  Copyright 2009 JetpackShark.com. All rights reserved.
//

#import "PolyPoint.h"


@implementation PolyPoint
@synthesize x;
@synthesize y;

- (CGPoint) point {
	CGPoint res;
	res.x = x;
	res.y = y;
	return res;
}
@end
