//
//  PolygonView.m
//  TestUIView
//
//  Created by 铮 罗 on 6/27/12.
//  Copyright (c) 2012 四川大学. All rights reserved.
//

#import "PolygonView.h"

@implementation PolygonView

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
    
    CGRect bounds = [self bounds];
    UIImage* image = [UIImage imageNamed:@"gradient.png"];
    [image drawInRect:bounds];

    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextBeginPath (context); 
    float length[2]={8.0,8.0};
    CGContextSetLineDash(context, 0., length, 1);
    CGContextMoveToPoint (context, 75, 10); 
    CGContextAddLineToPoint (context, 10, 150);
    CGContextAddLineToPoint (context, 160, 150); 
    CGContextClosePath (context);
    [[UIColor redColor] setFill];
    [[UIColor blackColor] setStroke]; 
    CGContextDrawPath (context, kCGPathFillStroke);
    
}

- (void)updateInterface
{
    [polygonName setText:@"Triangle"];
}

@end
