//
//  FoundDevicesTableViewController.m
//  BonjourAndStreams
//
//  Created by Alan Cannistraro on 3/2/10.
//  Copyright 2010 Apple. All rights reserved.
//

#import "FoundDevicesTableViewController.h"

#import "MessageSender.h"


@implementation FoundDevicesTableViewController


- (void)viewWillAppear:(BOOL)animated {
	_browser = [[NSNetServiceBrowser alloc] init];
	_browser.delegate = self;
	[_browser searchForServicesOfType:@"_sampleservice._tcp" inDomain:@""];
	[super viewWillAppear:animated];
}


- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];

	[_browser stop];
	_browser.delegate = nil;
	[_browser release];
	_browser = nil;

	[_foundServices removeAllObjects];
}

#pragma mark NSNetServiceBrowserDelegate

- (void)netServiceBrowser:(NSNetServiceBrowser *)netServiceBrowser didFindService:(NSNetService *)netService moreComing:(BOOL)moreServicesComing
{
	NSLog(@"found service %@", netService);
	if (!_foundServices)
		_foundServices = [[NSMutableArray alloc] init];
	
	[_foundServices addObject:netService];
	
	[self.tableView reloadData];
}

- (void)netServiceBrowser:(NSNetServiceBrowser *)netServiceBrowser didRemoveService:(NSNetService *)netService moreComing:(BOOL)moreServicesComing
{
	[_foundServices removeObject:netService];
}

- (void)netServiceBrowserDidStopSearch:(NSNetServiceBrowser *)aNetServiceBrowser
{
	[_foundServices removeAllObjects];
}

#pragma mark -
#pragma mark Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [_foundServices count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	NSNetService	*netService = [_foundServices objectAtIndex:indexPath.row];
    // Configure the cell...
	cell.textLabel.text = netService.name;
    
    return cell;
}




#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSNetService	*netService = [_foundServices objectAtIndex:indexPath.row];

	// Resolve the net service, and when successful, push a messaging screen
	netService.delegate = self;
	[netService resolveWithTimeout:5];
}

- (void)netServiceDidResolveAddress:(NSNetService *)sender
{
	MessageSender	*messageSender = [[MessageSender alloc] initWithNibName:@"MessageSender" bundle:nil];
	messageSender.netService = sender;
	
	[self.navigationController pushViewController:messageSender animated:YES];
}


@end

