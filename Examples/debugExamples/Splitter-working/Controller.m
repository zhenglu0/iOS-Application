#import "Controller.h"

@implementation Controller

@synthesize words;

- (IBAction)splitString
{
    NSString *string = textField.text;
    
    self.words = [string componentsSeparatedByString:@" "];
    [tableView reloadData];
	[textField resignFirstResponder];
}

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section
{
    return [words count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:nil];

    cell.text = [[words objectAtIndex:indexPath.row] capitalizedString];
    
    return cell;
}


@end
