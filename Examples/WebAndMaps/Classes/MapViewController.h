//
//  MapViewController.h
//  Untitled
//
//  Created by Alan Cannistraro on 2/11/10.
//  Copyright 2010 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface MapViewController : UIViewController <MKReverseGeocoderDelegate> {

	IBOutlet MKMapView	*mapView;
	MKReverseGeocoder	*reverseGeocoder;
}

- (IBAction)changeType:(id)sender;
- (IBAction)findMe:(id)sender;
- (IBAction)addAnnotations;



@end
