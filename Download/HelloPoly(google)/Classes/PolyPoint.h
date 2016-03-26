//
//  PolyPoint.h
//  HelloPoly
//
//  Created by Remy Porter on 4/9/09.
//  Copyright 2009 JetpackShark.com. All rights reserved.
//

#import <UIKit/UIKit.h>

//This is really boring, but I wanted an OOP point- I could have just used a pointer to CGPoint, but I did it this way.
@interface PolyPoint : NSObject {
	int x;
	int y;
}

@property int x;
@property int y;
@property (readonly) CGPoint point;

@end
