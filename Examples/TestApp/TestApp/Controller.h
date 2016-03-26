//
//  Controller.h
//  TestApp
//
//  Created by todd on 8/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Controller : NSObject {
    IBOutlet UISlider *mySlider;
    IBOutlet UILabel  *myLabel;
}

- (IBAction) slideMe;


@end
