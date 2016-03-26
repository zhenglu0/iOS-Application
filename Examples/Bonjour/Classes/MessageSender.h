//
//  MessageSender.h
//  Bonjour
//
//  Created by CS193P on 3/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MessageSender : UIViewController <UITextFieldDelegate>
{
	NSNetService	*netService;
	
	NSOutputStream	*outputStream;
}

@property (nonatomic, retain) NSNetService *netService;

@end
