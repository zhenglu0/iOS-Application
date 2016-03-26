//
//  main.m
//  test-app
//
//  Created by John on 6/26/09.
//  Copyright iPhoneDevTips.com All rights reserved.
//

#import <UIKit/UIKit.h>

int main(int argc, char *argv[]) {
    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, @"test_appAppDelegate");
    [pool release];
    return retVal;
}
