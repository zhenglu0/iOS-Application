//
//  ListOfLinksController.m
//  Untitled
//
//  Created by Alan Cannistraro on 2/11/10.
//  Copyright 2010 Apple. All rights reserved.
//

#import "ListOfLinksController.h"
#import "WebViewController.h"


@implementation ListOfLinksController


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 3;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	NSString	*link = nil;
	if (indexPath.row == 0)
	{
		link = @"<a href=\"http://apple.com\">Apple</a>";
	}
	else if (indexPath.row == 1)
	{
		link = @"<a href=\"http://wustl.edu\">WashU</a>";
	}
	else if (indexPath.row == 2)
	{
		link = @"<a href=\"http://disney.com\">Disney</a>";
	}

	NSString	*html = [NSString stringWithFormat:@"Go to %@", link];
	UIWebView	*webView = [[UIWebView alloc] initWithFrame:cell.contentView.bounds];
	webView.delegate = self;
	[webView loadHTMLString:html baseURL:nil];
	[cell.contentView addSubview:webView];
    
    return cell;
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
	if (navigationType == UIWebViewNavigationTypeLinkClicked)
	{
		WebViewController	*webViewController = [[WebViewController alloc] init];
		webViewController.url = request.URL;
		[self.navigationController pushViewController:webViewController animated:YES];
		[webViewController release];
		
		return NO;
	}
	
	return YES;
}



@end

