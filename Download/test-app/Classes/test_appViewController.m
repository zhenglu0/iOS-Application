//
//  test_appViewController.m
//  test-app
//
//  Copyright iPhoneDevTips.com All rights reserved.
//


#import "test_appViewController.h"

@implementation test_appViewController

- (void)buttonPressed:(UIButton *)button
{
	// Create image picker controller
  UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
  
  // Set source to the camera
	imagePicker.sourceType =  UIImagePickerControllerSourceTypeCamera;
  
  // Delegate is self
	imagePicker.delegate = self;
  
  // Allow editing of image ?
	imagePicker.allowsImageEditing = NO;
  
  // Show image picker
	[self presentModalViewController:imagePicker animated:YES];	

}

- (void) alertView:(UIAlertView *)alert clickedButtonAtIndex:(NSInteger)buttonIndex
{
	// After saving iamge, dismiss camera
	[self dismissModalViewControllerAnimated:YES];
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
  UIAlertView *alert;

	// Unable to save the image  
  if (error)
  	alert = [[UIAlertView alloc] initWithTitle:@"Error" 
                            message:@"Unable to save image to Photo Album." 
                            delegate:self cancelButtonTitle:@"Ok" 
                            otherButtonTitles:nil];
	else // All is well
  	alert = [[UIAlertView alloc] initWithTitle:@"Success" 
                            message:@"Image saved to Photo Album." 
                            delegate:self cancelButtonTitle:@"Ok" 
                            otherButtonTitles:nil];


  [alert show];
  [alert release];
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
	// Access the uncropped image from info dictionary
	UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];

	// Save image
  UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);

	[picker release];
}

- (id)init
{
  if (self = [super init]) 
  {
    self.view = [[[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]] autorelease];
		self.view.backgroundColor = [UIColor grayColor];

    // Button to activate camera
    button = [[UIButton alloc] initWithFrame:CGRectMake(80, 55, 162, 53)];    
    [button setBackgroundImage:[UIImage imageNamed:@"Camera.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents: UIControlEventTouchUpInside];      
    [self.view addSubview:button];
    [button release];
  }
  
  return self;  
}

- (void)dealloc 
{
  [super dealloc];
}

@end
