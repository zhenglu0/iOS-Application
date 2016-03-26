//
//  ViewController.m
//  TestUIView
//
//  Created by 铮 罗 on 6/27/12.
//  Copyright (c) 2012 四川大学. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad
{
    [super viewDidLoad];

    CGAffineTransform xform = CGAffineTransformMakeRotation(M_PI/4.0);
    CGAffineTransform scale = CGAffineTransformMakeScale(0.3, 0.3);
    polygonview.transform = xform;
    [polygonview setTransform:scale];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
