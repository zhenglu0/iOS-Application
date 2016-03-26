//
//  Controller.h
//  SimpleAnimation
//
//  Created by todd on 9/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Controller : NSObject {
    IBOutlet UIImageView *myImage;
    IBOutlet UISwitch *mySwitch;
}

-(IBAction) useSwitch;

@end
