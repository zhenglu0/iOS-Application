//
//  MapViewController.m
//  Untitled
//
//  Created by Alan Cannistraro on 2/11/10.
//  Copyright 2010 Apple. All rights reserved.
//

#import "MapViewController.h"

@implementation MapViewController


- (void)dealloc
{
	[mapView release];
	
	[super dealloc];
}

- (IBAction)changeType:(id)sender
{
	UISegmentedControl	*type = (UISegmentedControl *)sender;
	NSInteger	index = type.selectedSegmentIndex;
	mapView.mapType = index;
}

#pragma mark


- (IBAction)addAnnotations
{
	CLLocationCoordinate2D	coordinate1 = {
		41.890158,12.492185
	};
	NSDictionary	*address = [NSDictionary dictionaryWithObjectsAndKeys:@"Italy", @"Country", nil];
	MKPlacemark	*rome = [[MKPlacemark alloc] initWithCoordinate:coordinate1 addressDictionary:address];
	[mapView addAnnotation:rome];
	[rome release];
	
	CLLocationCoordinate2D coordinate2 = {
		48.858196,2.294748
	};
	address = [NSDictionary dictionaryWithObjectsAndKeys:@"France", @"Country", nil];
	MKPlacemark *paris = [[MKPlacemark alloc] initWithCoordinate:coordinate2 addressDictionary:address];
	[mapView addAnnotation:paris];
	[paris release];
} 


#pragma mark Location


 - (void)updateUserLocation
{
	MKUserLocation	*userLocation = mapView.userLocation;
	CLLocationCoordinate2D	coordinate = userLocation.location.coordinate;

	[mapView setCenterCoordinate:coordinate animated:YES];

	
	
	if (!reverseGeocoder)
	{
		reverseGeocoder = [[MKReverseGeocoder alloc] initWithCoordinate:coordinate];
		reverseGeocoder.delegate = self;
		[reverseGeocoder start];
	}
	
	
	

	
}

- (IBAction)findMe:(id)sender
{
	UISwitch	*control = (UISwitch *)sender;
	
	mapView.showsUserLocation = control.isOn;
	
	if (mapView.showsUserLocation)
		[self updateUserLocation];
}

- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFindPlacemark:(MKPlacemark *)placemark
{
	mapView.userLocation.title = placemark.title;
}

- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFailWithError:(NSError *)error
{
	NSLog(@"Geocode failed with error %@",error);

} 


@end
