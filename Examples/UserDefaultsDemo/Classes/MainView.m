//
//  MainView.m
//  UserDefaultsDemo
//
//  Created by Chris Marcellino on 1/24/10.
//  Copyright Chris Marcellino 2010. All rights reserved.
//

#import "MainView.h"

@implementation MainView

- (void)drawRect:(CGRect)rect {
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"UseRedColor"]) {
        [[UIColor redColor] setFill];
    } else {
        [[UIColor whiteColor] setFill];
    }
    
    UIRectFill(rect);
}

@end
