//
//  WebViewController.h
//  Untitled
//
//  Created by Alan Cannistraro on 2/11/10.
//  Copyright 2010 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WebViewController : UIViewController <UITextFieldDelegate, UIWebViewDelegate>
{
	NSURL	*url;
	
	IBOutlet	UITextField *addressField;
	IBOutlet	UIWebView	*webView;
}

@property (nonatomic, retain) NSURL *url;

@end
