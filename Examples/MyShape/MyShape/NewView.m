//
//  NewView.m
//  MyShape
//
//  Created by todd on 9/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NewView.h"


@implementation NewView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGRect mybounds = [self bounds];
    [[UIColor greenColor] set];
    UIRectFill(mybounds);
    
    CGRect myBox = CGRectMake(10,10,50,100);
    [[UIColor blueColor] set];
    UIRectFill(myBox);
    
    
}


- (void)dealloc
{
    [super dealloc];
}

@end
